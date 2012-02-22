<?php
/*
 * Crypt Class
 * Simple class which handles the encryption and decryption of
 * confidential information suitable for secure storage within
 * a database.
 *
 * Author: Ninad Desai
 * Date : Feb 22, 2012
 * Copyright (c) 2012, Ninad Desai<ninad.desai@in.v2solutions.com>.
 * All rights reserved.
 *
 * This class uses AES 256 encryption to encrypt the sonfidential data.
 * Explanation behind block size, IV size used are mentioned @ bottom of this class as a refernece behind thought process.
 * 
 */
class MathComponent extends Object {

	var $controller;

    /* Attribute Value Container */
    protected $_attr                = array();
    private   $_passkey             = null;

    /* Defaults to AES 128 bit encryption in CFB mode (uses an IV) */
    const CIPHER                    = MCRYPT_RIJNDAEL_256;
    const CIPHER_MODE               = MCRYPT_MODE_CFB;
    const KEY_LENGTH                = 32;

    /* Max size of value to encrypt */
    const ENCRYPT_CHUNK_BYTES       = 24;

    /* Size of outputted iv/encrypted text pair (estimate) */
    const ENCRYPT_CHUNK_STORAGE     = 90;



    /**
     * 
     * @param   array       Optional attributes passed as an array.
     * @return  Component Object
     */
    public function __construct(array $attr = array())
    {
        if (!function_exists('mcrypt_encrypt')) {
            throw new Exception(
                'php-mcrypt library not installed. This library is required for server side encryption capabilities.'
            );
        }

        $this->_attr = $attr;
    }


    /**
     * Scans available attribute names and tries to return the correct
     * numerical constant value.
     *
     * @param   mixed       Search
     * @return  integer
     */
    protected function _lookupAttribute($attr)
    {
        if (preg_match('/^[0-9]+$/', $attr)) {
            $attr = (int)$attr;
        } else {
            $textLabels = $this->_getTextLabels();
            foreach ($textLabels as $index => $label) {
                $labels = array($label);
                $func = create_function('$c', 'return strtoupper($c[1]);');
                $camelCase = preg_replace_callback('/_([a-z])/', $func, $label);
                $labels[] = $camelCase;

                if (in_array($attr, $labels)) {
                    $attr = $index;
                    break;
                }
            }
        }

        return $attr;
    }

	//called before Controller::beforeFilter()
	function initialize(&$controller, $settings = array())
	{
		// saving the controller reference for later use
		$this->controller =& $controller;
	}


    /**
     * Sets the value for an attribute such as credit card number
     * or name. For a list of attributes, see the header of this
     * file.
     *
     * @param   integer     Attribute (see class comments)
     * @param   mixed       Value
     * @param   boolean     Is the value from data storage? Would
     *                      it need to be decrypted if it's a
     *                      secure attribute?
     * @return  CryptComponent (object)
     * @throws  Exception
     */
    public function set($attr, $value, $fromStorage = false)
    {
        $attr = $this->_lookupAttribute($attr);

        switch ($attr) {
            // Special combined value of the card number and expiration date
            case self::SECURE_STORE:
                // This value is always encrypted, so we ignore $fromStorage
                $plain = $this->_decrypt($value);
                if ($plain && preg_match('/^([0-9]{2})([0-9]{4})(.*)/', $plain, $matches)) {
                    list(
                        $ignore,
                        $this->_attr[self::EXPIRE_MONTH],
                        $this->_attr[self::EXPIRE_YEAR],
                        $this->_attr[self::NUMBER]
                    ) = $matches;
                } else {
                    throw new CreditCardFreezer_Exception(
                        'Secure store value does not decrypt to the expected '
                        . 'values. Perhaps the passkey has been changed? This can '
                        . 'happen if you do not set a passkey and move the source '
                        . 'file.'
                    );
                }
                break;

            case self::NUMBER:
            case self::EXPIRE_MONTH:
            case self::EXPIRE_YEAR:
            case self::CCV:
                if ($fromStorage) {
                    $this->_attr[$attr] = $this->_decrypt($value);
                } else {
                    $this->_attr[$attr] = preg_replace('/[^0-9]/', '', $value);
                }
                break;

            default:
                $this->_attr[$attr] = $value;
                break;
        }

        return $this;
    }


    /**
     * Generate a random 8-byte IV.
     * @return  integer
     */
    private function _getIV()
    {
        $size = mcrypt_get_iv_size(self::CIPHER, self::CIPHER_MODE);
        return mcrypt_create_iv($size, MCRYPT_RAND);
    }


    /**
     * Encrypts a plain text value by creating a
     * unique iv for the transaction and truncating
     * it to the result of the mcrypt cipher.
     *
     * @param   string      Plain text value
     * @return  string      iv/encrypted text pair
     */
    private function _encrypt($value)
    {
        $len = strlen($value);
        if ($len > self::ENCRYPT_CHUNK_BYTES) {
            throw new CreditCardFreezer_Exception('Value to encrypt is too '
                . 'long. Should not exceed ' . self::ENCRYPT_CHUNK_BYTES . ' characters.'
            );
        } elseif ($len < self::ENCRYPT_CHUNK_BYTES) {
            $value = str_pad($value, self::ENCRYPT_CHUNK_BYTES);
        }

        // Most values are numerical (e.g.: card number, date, etc.)
        // We change the values to alphanumeric just to scramble any
        // patterns in the encrypted text.
        $value = base64_encode($value);

        $store = mcrypt_encrypt(
            self::CIPHER,
            $this->getPassKey(),
            $value,
            self::CIPHER_MODE,
            $iv = $this->_getIV()
        );

        return sprintf('%s|%s',
            base64_encode($iv),
            base64_encode($store)
        );
    }


}


/*
 *	################# EXPLANATION BEHIND VALUES USED FOR AES CONFIGURATION CONSTANTS i.e. Block Size, IV byte
 *
	// This PHP code snippet provides a basic understanding of
	// PHP's AES encryption. - Source http://www.chilkatsoft.com/p/php_aes.asp

	// The first thing to understand is the meaning of these constants:
	// MCRYPT_RIJNDAEL_128
	// MCRYPT_RIJNDAEL_192
	// MCRYPT_RIJNDAEL_256
	// You would think that MCRYPT_RIJNDAEL_256 specifies 256-bit encryption,
	// but that is wrong.  The three choices specify the block-size to be used
	// with Rijndael encryption.  They say nothing about the key size (i.e. strength)
	// of the encryption.  (Read further to understand how the strength of the
	// AES encryption is set.)
	//
	// The Rijndael encyrption algorithm is a block cipher.  It operates on discrete
	// blocks of data.  Padding MUST be added such that
    // the data to be encrypted has a length that is a multiple of the block size.
	// (PHP pads with NULL bytes)
	// Thus, if you specify MCRYPT_RIJNDAEL_256, your encrypted output will always
	// be a multiple of 32 bytes (i.e. 256 bits).  If you specify MCRYPT_RIJNDAEL_128,
	// your encrypted output will always be a multiple of 16 bytes.
	//
	// Note: Strictly speaking, AES is not precisely Rijndael (although in practice
	// they are used interchangeably) as Rijndael supports a larger range of block
	// and key sizes; AES has a fixed block size of 128 bits and a key size of
	// 128, 192, or 256 bits, whereas Rijndael can be specified with key and block
	// sizes in any multiple of 32 bits, with a minimum of 128 bits and a maximum of
	// 256 bits.
	// In summary: If you want to be AES compliant, always choose MCRYPT_RIJNDAEL_128.
	//
	// So the first step is to create the cipher object:
	$cipher = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, '');

	// We're using CBC mode (cipher-block chaining).  Block cipher modes are detailed
	// here: http://en.wikipedia.org/wiki/Block_cipher_modes_of_operation

	// CBC mode requires an initialization vector.  The size of the IV (initialization
	// vector) is always equal to the block-size.  (It is NOT equal to the key size.)
	// Given that our block size is 128-bits, the IV is also 128-bits (i.e. 16 bytes).
	// Thus, for AES encryption, the IV is always 16 bytes regardless of the
	// strength of encryption.
	//
	// Here's some PHP code to verify our IV size:
	$iv_size = mcrypt_enc_get_iv_size($cipher);
	printf("iv_size = %d\n",$iv_size);

	// How do you do 256-bit AES encryption in PHP vs. 128-bit AES encryption???
	// The answer is:  Give it a key that's 32 bytes long as opposed to 16 bytes long.
	// For example:
	$key256 = '12345678901234561234567890123456';
	$key128 = '1234567890123456';

	// Here's our 128-bit IV which is used for both 256-bit and 128-bit keys.
	$iv =  '1234567890123456';

	printf("iv: %s\n",bin2hex($iv));
	printf("key256: %s\n",bin2hex($key256));
	printf("key128: %s\n",bin2hex($key128));

	// This is the plain-text to be encrypted:
	$cleartext = 'The quick brown fox jumped over the lazy dog';
	printf("plainText: %s\n\n",$cleartext);

	// The mcrypt_generic_init function initializes the cipher by specifying both
	// the key and the IV.  The length of the key determines whether we're doing
	// 128-bit, 192-bit, or 256-bit encryption.
	// Let's do 256-bit encryption here:
	if (mcrypt_generic_init($cipher, $key256, $iv) != -1)
	{
		// PHP pads with NULL bytes if $cleartext is not a multiple of the block size..
		$cipherText = mcrypt_generic($cipher,$cleartext );
		mcrypt_generic_deinit($cipher);

		// Display the result in hex.
		printf("256-bit encrypted result:\n%s\n\n",bin2hex($cipherText));
	}

	// Now let's do 128-bit encryption:
	if (mcrypt_generic_init($cipher, $key128, $iv) != -1)
	{
		// PHP pads with NULL bytes if $cleartext is not a multiple of the block size..
		$cipherText = mcrypt_generic($cipher,$cleartext );
		mcrypt_generic_deinit($cipher);

		// Display the result in hex.
		printf("128-bit encrypted result:\n%s\n\n",bin2hex($cipherText));
	}

	// -------
	// Results
	// -------
	// You may use these as test vectors for testing your AES implementations...
	//
	// ------------------------
	// 256-bit key, CBC mode
	// ------------------------
	// IV = '1234567890123456'
	//  (hex: 31323334353637383930313233343536)
	// Key = '12345678901234561234567890123456'
	//  (hex: 3132333435363738393031323334353631323334353637383930313233343536)
	// PlainText:
	//  'The quick brown fox jumped over the lazy dog'
	// CipherText(hex):
	//  2fddc3abec692e1572d9b7d629172a05caf230bc7c8fd2d26ccfd65f9c54526984f7cb1c4326ef058cd7bee3967299e3

	//
	// ------------------------
	// 128-bit key, CBC mode
	// ------------------------
	// IV = '1234567890123456'
	//  (hex: 31323334353637383930313233343536)
	// Key = '1234567890123456'
	//  (hex: 31323334353637383930313233343536)
	// PlainText:
	//  'The quick brown fox jumped over the lazy dog'
	// CipherText(hex):
	//  f78176ae8dfe84578529208d30f446bbb29a64dc388b5c0b63140a4f316b3f341fe7d3b1a3cc5113c81ef8dd714a1c99

*/