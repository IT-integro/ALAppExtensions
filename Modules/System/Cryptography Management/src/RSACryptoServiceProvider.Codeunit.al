// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

/// <summary>
/// Performs asymmetric encryption and decryption using the implementation of the RSA algorithm provided by the cryptographic service provider (CSP).
/// </summary>
codeunit 1445 "RSACryptoServiceProvider"
{
    Access = Public;

    var
        RSACryptoServiceProviderImpl: Codeunit "RSACryptoServiceProvider Impl.";

    /// <summary>
    /// Creates and returns an XML string containing the key of the current RSA object.
    /// </summary>
    /// <param name="IncludePrivateParameters">true to include a public and private RSA key; false to include only the public key.</param>
    /// <returns>An XML string containing the key of the current RSA object.</returns>
    procedure ToXmlString(IncludePrivateParameters: Boolean): Text
    begin
        exit(RSACryptoServiceProviderImpl.ToXmlString(IncludePrivateParameters));
    end;

    /// <summary>
    /// Computes the hash value of the specified data and signs it.
    /// </summary>
    /// <param name="XmlString">The XML string containing RSA key information.</param>
    /// <param name="DataInStream">The input stream to hash and sign.</param>
    /// <param name="HashAlgorithm">The hash algorithm to use to create the hash value.</param>
    /// <param name="SignatureOutStream">The RSA signature stream for the specified data.</param>
    procedure SignData(XmlString: Text; DataInStream: InStream; HashAlgorithm: Enum "Hash Algorithm"; SignatureOutStream: OutStream)
    begin
        RSACryptoServiceProviderImpl.SignData(XmlString, DataInStream, HashAlgorithm, SignatureOutStream);
    end;

    /// <summary>
    /// Verifies that a digital signature is valid by determining the hash value in the signature using the provided public key and comparing it to the hash value of the provided data.
    /// </summary>
    /// <param name="XmlString">The XML string containing RSA key information.</param>
    /// <param name="DataInStream">The input stream of data that was signed.</param>
    /// <param name="HashAlgorithm">The name of the hash algorithm used to create the hash value of the data.</param>
    /// <param name="SignatureInStream">The stream of signature data to be verified.</param>
    /// <returns>True if the signature is valid; otherwise, false.</returns>
    procedure VerifyData(XmlString: Text; DataInStream: InStream; HashAlgorithm: Enum "Hash Algorithm"; SignatureInStream: InStream): Boolean
    begin
        exit(RSACryptoServiceProviderImpl.VerifyData(XmlString, DataInStream, HashAlgorithm, SignatureInStream));
    end;

    /// <summary>
    /// Encrypts the specified text.
    /// </summary>
    /// <param name="XmlString">The XML string containing RSA key information.</param>
    /// <param name="PlainTextInStream">The input stream to encrypt.</param>
    /// <param name="RSAEncryptionPadding">The RSA encryption padding to use to encrypt the specified text.</param>
    /// <param name="EncryptedTextOutStream">The RSA encryption stream for the specified text.</param>
    procedure Encrypt(XmlString: Text; PlainTextInStream: InStream; RSAEncryptionPadding: Enum RSAEncryptionPadding; EncryptedTextOutStream: OutStream)
    begin
        RSACryptoServiceProviderImpl.Encrypt(XmlString, PlainTextInStream, RSAEncryptionPadding, EncryptedTextOutStream);
    end;

    /// <summary>
    /// Decrypts the specified text.
    /// </summary>
    /// <param name="XmlString">The XML string containing RSA key information.</param>
    /// <param name="EncryptedTextInStream">The input stream to decrypt.</param>
    /// <param name="RSAEncryptionPadding">The RSA encryption padding to use to decrypt the specified text.</param>
    /// <param name="DecryptedTextOutStream">The RSA decryption stream for the specified text.</param>
    procedure Decrypt(XmlString: Text; EncryptedTextInStream: InStream; RSAEncryptionPadding: Enum RSAEncryptionPadding; DecryptedTextOutStream: OutStream)
    begin
        RSACryptoServiceProviderImpl.Decrypt(XmlString, EncryptedTextInStream, RSAEncryptionPadding, DecryptedTextOutStream);
    end;
}