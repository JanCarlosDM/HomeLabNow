#HomeLabNow
#Script para generar certificados auto firmados para Hyper-V Replica
#@JanCarlosDM



#Certificado para la Entidad Certificadora.

New-SelfSignedCertificate -Type “Custom” -KeyExportPolicy “Exportable” -Subject “CN=RootCA” -CertStoreLocation “Cert:\LocalMachine\My” -KeySpec “Signature” -KeyUsage “CertSign”

# Certificado HOST-01

New-SelfSignedCertificate -type “Custom” -KeyExportPolicy “Exportable” -Subject “CN=HOST-01” -CertStoreLocation “Cert:\LocalMachine\My” -KeySpec “KeyExchange” -TextExtension @(“2.5.29.37={text}1.3.6.1.5.5.7.3.1,1.3.6.1.5.5.7.3.2”) -Signer “Cert:LocalMachine\My\3E3354172B7585832D4450ADC218E8EEB7064C31” -Provider “Microsoft Enhanced RSA and AES Cryptographic Provider”

# Certificado HOST-02

New-SelfSignedCertificate -type “Custom” -KeyExportPolicy “Exportable” -Subject “CN=HOST-02” -CertStoreLocation “Cert:\LocalMachine\My” -KeySpec “KeyExchange” -TextExtension @(“2.5.29.37={text}1.3.6.1.5.5.7.3.1,1.3.6.1.5.5.7.3.2”) -Signer “Cert:LocalMachine\My\3E3354172B7585832D4450ADC218E8EEB7064C31” -Provider “Microsoft Enhanced RSA and AES Cryptographic Provider”  

#Deshabilitar Verificación lista de revocación
reg add “HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\Replication” /v DisableCertRevocationCheck /d 1 /t REG_DWORD /f 