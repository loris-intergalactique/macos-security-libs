#ifndef _SECURITY_SECIMPORTEXPORTPRIV_H_
#define _SECURITY_SECIMPORTEXPORTPRIV_H_

#include <Security/SecImportExport.h>

__BEGIN_DECLS

CF_ASSUME_NONNULL_BEGIN
CF_IMPLICIT_BRIDGING_ENABLED

#if TARGET_OS_OSX
OSStatus SecPKCS12Import_ios(CFDataRef pkcs12_data, CFDictionaryRef options, CFArrayRef * __nonnull CF_RETURNS_RETAINED items)
     SPI_AVAILABLE(macos(10.15), iosmac(13.0)) API_UNAVAILABLE(ios, watchos, tvos);
#endif

CF_IMPLICIT_BRIDGING_DISABLED
CF_ASSUME_NONNULL_END

__END_DECLS

#endif /* !_SECURITY_SECIMPORTEXPORTPRIV_H_ */
