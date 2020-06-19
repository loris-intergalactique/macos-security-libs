/*
 * Copyright (c) 2016 Apple Inc. All Rights Reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 *
 * This file contains Original Code and/or Modifications of Original Code
 * as defined in and that are subject to the Apple Public Source License
 * Version 2.0 (the 'License'). You may not use this file except in
 * compliance with the License. Please obtain a copy of the License at
 * http://www.opensource.apple.com/apsl/ and read it before using this
 * file.
 *
 * The Original Code and all software distributed under the License are
 * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
 * Please see the License for the specific language governing rights and
 * limitations under the xLicense.
 *
 * @APPLE_LICENSE_HEADER_END@
 */

#include <libDER/asn1Types.h>
#include <libDER/DER_Encode.h>
#include <libDER/DER_Decode.h>
#include <libDER/DER_Keys.h>

#import <Foundation/Foundation.h>

#import <Security/Security.h>
#import <Security/SecCertificatePriv.h>

#include "keychain_regressions.h"
#include "kc-helpers.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-Wunused-function"

//
//  testPubKeyImport
//  <rdar://problem/10473567>
//

/* test RSA public key to import */
static const uint8_t kPublicKey[] =
{
	0x30,0x82,0x01,0x0A,0x02,0x82,0x01,0x01,0x00,0xE7,0xD7,0x44,0xF2,0xA2,0xE2,0x78,
	0x8B,0x6C,0x1F,0x55,0xA0,0x8E,0xB7,0x05,0x44,0xA8,0xFA,0x79,0x45,0xAA,0x8B,0xE6,
	0xC6,0x2C,0xE5,0xF5,0x1C,0xBD,0xD4,0xDC,0x68,0x42,0xFE,0x3D,0x10,0x83,0xDD,0x2E,
	0xDE,0xC1,0xBF,0xD4,0x25,0x2D,0xC0,0x2E,0x6F,0x39,0x8B,0xDF,0x0E,0x61,0x48,0xEA,
	0x84,0x85,0x5E,0x2E,0x44,0x2D,0xA6,0xD6,0x26,0x64,0xF6,0x74,0xA1,0xF3,0x04,0x92,
	0x9A,0xDE,0x4F,0x68,0x93,0xEF,0x2D,0xF6,0xE7,0x11,0xA8,0xC7,0x7A,0x0D,0x91,0xC9,
	0xD9,0x80,0x82,0x2E,0x50,0xD1,0x29,0x22,0xAF,0xEA,0x40,0xEA,0x9F,0x0E,0x14,0xC0,
	0xF7,0x69,0x38,0xC5,0xF3,0x88,0x2F,0xC0,0x32,0x3D,0xD9,0xFE,0x55,0x15,0x5F,0x51,
	0xBB,0x59,0x21,0xC2,0x01,0x62,0x9F,0xD7,0x33,0x52,0xD5,0xE2,0xEF,0xAA,0xBF,0x9B,
	0xA0,0x48,0xD7,0xB8,0x13,0xA2,0xB6,0x76,0x7F,0x6C,0x3C,0xCF,0x1E,0xB4,0xCE,0x67,
	0x3D,0x03,0x7B,0x0D,0x2E,0xA3,0x0C,0x5F,0xFF,0xEB,0x06,0xF8,0xD0,0x8A,0xDD,0xE4,
	0x09,0x57,0x1A,0x9C,0x68,0x9F,0xEF,0x10,0x72,0x88,0x55,0xDD,0x8C,0xFB,0x9A,0x8B,
	0xEF,0x5C,0x89,0x43,0xEF,0x3B,0x5F,0xAA,0x15,0xDD,0xE6,0x98,0xBE,0xDD,0xF3,0x59,
	0x96,0x03,0xEB,0x3E,0x6F,0x61,0x37,0x2B,0xB6,0x28,0xF6,0x55,0x9F,0x59,0x9A,0x78,
	0xBF,0x50,0x06,0x87,0xAA,0x7F,0x49,0x76,0xC0,0x56,0x2D,0x41,0x29,0x56,0xF8,0x98,
	0x9E,0x18,0xA6,0x35,0x5B,0xD8,0x15,0x97,0x82,0x5E,0x0F,0xC8,0x75,0x34,0x3E,0xC7,
	0x82,0x11,0x76,0x25,0xCD,0xBF,0x98,0x44,0x7B,0x02,0x03,0x01,0x00,0x01,0xD4,0x9D
};

#if 0
static const uint8_t k512PublicKeyModulus[] =
{
	0x00,
	0xE2,0x7E,0x6C,0xDE,0xF4,0x45,0x8E,0x69,0xFF,0x9B,0x39,0x76,0x41,0x44,0x2E,0x2E,
	0x61,0x27,0x07,0x0F,0x56,0xC9,0x6F,0x3F,0x71,0x82,0x67,0x1F,0xEB,0x0B,0xED,0x65,
	0x09,0x9B,0x12,0x29,0x61,0x1D,0x66,0x3B,0x8C,0x63,0x0F,0x30,0x5C,0x00,0x42,0x85,
	0x6F,0xD5,0xFB,0xF5,0x3D,0x63,0x99,0xC1,0xDE,0xD7,0x42,0x30,0x51,0x42,0xF3,0xD9
};

static const uint8_t k512PublicKeyExponent[] = { 0x01,0x00,0x01 }; // 65537
#endif

static const uint8_t k1024PublicKeyModulus[] =
{
	0x00,
	0xBF,0x53,0x5F,0x27,0x26,0x28,0xD1,0x02,0x52,0x75,0x54,0xFB,0x5F,0xF1,0xBE,0x94,
	0xB0,0x3B,0x33,0xB0,0x36,0xF6,0xF8,0x14,0xB9,0x62,0xEC,0xFC,0x31,0xF2,0xAB,0x60,
	0x59,0x02,0xB7,0x68,0x6C,0x91,0x91,0x9E,0xE8,0x08,0xF0,0x49,0xD9,0xBD,0x24,0x5A,
	0xB9,0xD6,0x08,0x89,0xA0,0xF1,0xBC,0xC7,0xB4,0x55,0xB5,0x0E,0x1A,0xA5,0xCC,0x94,
	0x4E,0x57,0xB6,0xA9,0x6B,0x5C,0x90,0x28,0x6F,0xBD,0x8C,0x12,0xF9,0x59,0x5E,0x47,
	0xDB,0x4C,0x7F,0x4D,0xB8,0x12,0x0A,0x36,0x9B,0x6F,0x8B,0xCC,0xB3,0x0F,0x60,0x23,
	0xED,0x91,0x78,0x28,0x0A,0x5E,0xF4,0x24,0xC6,0xDD,0x80,0x50,0xC4,0xCD,0xF6,0x52,
	0x6B,0xDD,0x35,0x82,0xCE,0xF2,0x7B,0xA4,0x73,0xD9,0x5F,0x75,0x2D,0xB6,0x77,0xAD
};

static const uint8_t k1024PublicKeyExponent[] = { 0x01,0x00,0x01 }; // 65537


static void
testPubKeyImport(void)
{
	OSStatus status = errSecSuccess;
	CFArrayRef outputItems = nil;
    SecKeychainRef keychain = NULL;
	NSData* keyData = [NSData dataWithBytes:kPublicKey length:sizeof(kPublicKey)];
	SecExternalFormat format = kSecFormatUnknown;
	SecExternalItemType keyType = kSecItemTypePublicKey;

    status = SecKeychainCopyDefault(&keychain);
    // ignoring error

	status = SecItemImport((CFDataRef)keyData,
		NULL, &format, &keyType, 0, NULL,
        keychain, &outputItems);

	NSLog(@"SecItemImport result = %d", (int)status);

    if (keychain) CFRelease(keychain);
    if (outputItems) CFRelease(outputItems);
}

static void
testPubKeyImportWithModulusAndExponent(SecKeychainRef keychain)
{
	OSStatus status = errSecSuccess;

    typedef struct SecRSAPublicKeyParams {
        uint8_t             *modulus;			/* modulus */
        CFIndex             modulusLength;
        uint8_t             *exponent;			/* public exponent */
        CFIndex             exponentLength;
    } SecRSAPublicKeyParams;
#if 0
    SecRSAPublicKeyParams pubKeyParams = {
    	.modulus = (uint8_t *)k512PublicKeyModulus,
    	.modulusLength = sizeof(k512PublicKeyModulus),
    	.exponent = (uint8_t *)k512PublicKeyExponent,
    	.exponentLength = sizeof(k512PublicKeyExponent),
    };
#else
    SecRSAPublicKeyParams pubKeyParams = {
    	.modulus = (uint8_t *)k1024PublicKeyModulus,
    	.modulusLength = sizeof(k1024PublicKeyModulus),
    	.exponent = (uint8_t *)k1024PublicKeyExponent,
    	.exponentLength = sizeof(k1024PublicKeyExponent),
    };
#endif
//    SecKeyRef key = SecKeyCreateRSAPublicKey(NULL, (const uint8_t *)&pubKeyParams,
//		sizeof(pubKeyParams), kSecKeyEncodingRSAPublicParams);

    // wrap as PKCS1
	DERSize m_size = pubKeyParams.modulusLength;
	DERSize e_size = pubKeyParams.exponentLength;
	const DERSize seq_size = DERLengthOfItem(ASN1_INTEGER, m_size) +
		DERLengthOfItem(ASN1_INTEGER, e_size);
	const DERSize result_size = DERLengthOfItem(ASN1_SEQUENCE, seq_size);
    DERSize r_size, remaining_size = result_size;
    DERReturn drtn;

	CFMutableDataRef pkcs1 = CFDataCreateMutable(NULL, result_size);
    ok(pkcs1, "%s: create CFData", testName);
	if (pkcs1 == NULL) {
	    NSLog(@"CFDataCreateMutable failed");
		return;
	}
	CFDataSetLength(pkcs1, result_size);
	uint8_t *bytes = CFDataGetMutableBytePtr(pkcs1);

    *bytes++ = ONE_BYTE_ASN1_CONSTR_SEQUENCE;
	remaining_size--;
	r_size = 4;
	drtn = DEREncodeLength(seq_size, bytes, &r_size);
	if (r_size <= remaining_size) {
		bytes += r_size;
		remaining_size -= r_size;
	}
	r_size = remaining_size;
    drtn = DEREncodeItem(ASN1_INTEGER, m_size, (const DERByte *)pubKeyParams.modulus, (DERByte *)bytes, &r_size);
    if (r_size <= remaining_size) {
    	bytes += r_size;
    	remaining_size -= r_size;
    }
	r_size = remaining_size;
    drtn = DEREncodeItem(ASN1_INTEGER, e_size, (const DERByte *)pubKeyParams.exponent, (DERByte *)bytes, &r_size);


    SecExternalFormat externalFormat = kSecFormatBSAFE; //kSecFormatOpenSSL;
    SecExternalItemType externalItemType = kSecItemTypePublicKey;
    CFArrayRef outArray = NULL;

    status = SecItemImport(pkcs1, NULL, &externalFormat, &externalItemType, 0, NULL, keychain, &outArray);
    CFReleaseNull(pkcs1);
    ok_status(status, "%s: SecItemImport", testName);
    if (status != errSecSuccess) {
    	NSLog(@"SecItemImport result = %d", (int)status);
		return;
	}

    // TODO: encrypt something with this key and check the result

    if (outArray) CFRelease(outArray);
}

int kc_26_key_import_public(int argc, char *const *argv)
{
    plan_tests(5);
    initializeKeychainTests(__FUNCTION__);

    SecKeychainRef kc = getPopulatedTestKeychain();

//    testPubKeyImport();
    testPubKeyImportWithModulusAndExponent(kc);

    ok_status(SecKeychainDelete(kc), "%s: SecKeychainDelete", testName);
    CFReleaseNull(kc);

    deleteTestFiles();
    return 0;
}

#pragma clang diagnostic pop
