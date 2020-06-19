/*
 * Copyright (c) 2003-2004,2012,2014 Apple Inc. All Rights Reserved.
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
 * limitations under the License.
 * 
 * @APPLE_LICENSE_HEADER_END@
 *
 * mds_install.cpp
 */

#include "security_tool.h"
#include "mds_install.h"
#include <security_cdsa_client/mdsclient.h>

int
mds_install(int argc, char * const *argv)
{
	if(argc != 1) {
		/* crufty "show usage" return code */
		return SHOW_USAGE_MESSAGE;
	}

	try {
		MDSClient::mds().install();
	}
	catch(const CssmError &err) {
		cssmPerror("MDS_Install", err.error);
		return -1;
	}
	catch(...) {
		/* should never happen */
		fprintf(stderr, "Unexpected error on MDS_Install\n");
		return -1;
	}
	return 0;
}
