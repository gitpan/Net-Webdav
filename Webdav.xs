/* $Id: Webdav.xs,v 1.9 2001/05/23 08:37:35 richter Exp $ */

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif





#ifdef __cplusplus
extern "C" {
#endif
#include "http_request.h"
#include "neon_i18n.h"
#include "uri.h"
#include "neon_md5.h"
#include "ne_alloc.h"
#include "http_cookies.h"
#include "http_utils.h"
#include "string_utils.h"
#include "nsocket.h"
#include "dav_207.h"
#include "neon_defs.h"
#include "http_redirect.h"
#include "http_basic.h"
#include "dav_locks.h"
#include "dav_basic.h"
#include "dates.h"
#include "http_auth.h"
#include "hip_xml.h"
#include "dav_props.h"
#ifdef __cplusplus
}
#endif



SV * __fetchmember (HV * pHV, char * pKey)
    {
    SV ** ppSV = hv_fetch (pHV, pKey, strlen (pKey), 1) ;
    if (!ppSV || !*ppSV)
        croak ("bad hash") ;

    return *ppSV ;
    }

HV * pC2Perl ;
HV * pPerl2C ;



    struct perl_callback_data 
        {
        SV * pUser ;
        CV * pCallback ;
        } ;


    
    /* *** dav_207_end_propstat set by dav_207_set_propstat_handlers *** */

void neon_cb___cb__19 (
    void *userdata, void *propstat, const char *status_line, 
    const http_status *status, const char *description)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__19", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)propstat);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, status_line);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("status must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setiv(__fetchmember(_pHV_,"major_version"), (IV)status->major_version);
	;
	sv_setiv(__fetchmember(_pHV_,"minor_version"), (IV)status->minor_version);
	;
	sv_setiv(__fetchmember(_pHV_,"code"), (IV)status->code);
	;
	sv_setiv(__fetchmember(_pHV_,"klass"), (IV)status->klass);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"reason_phrase"), status->reason_phrase);
	;

        }
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, description);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_207_end_response set by dav_207_set_response_handlers *** */

void neon_cb___cb__20 (
    void *userdata, void *response, const char *status_line,
    const http_status *status, const char *description)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__20", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)response);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, status_line);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("status must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setiv(__fetchmember(_pHV_,"major_version"), (IV)status->major_version);
	;
	sv_setiv(__fetchmember(_pHV_,"minor_version"), (IV)status->minor_version);
	;
	sv_setiv(__fetchmember(_pHV_,"code"), (IV)status->code);
	;
	sv_setiv(__fetchmember(_pHV_,"klass"), (IV)status->klass);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"reason_phrase"), status->reason_phrase);
	;

        }
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, description);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_lock_result set by dav_lock_discover *** */

void neon_cb___cb__2 (void *userdata, const struct dav_lock *lock, 
				const char *uri, const http_status *status)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__2", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&lock), sizeof(lock), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Lock", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)lock), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, uri);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("status must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setiv(__fetchmember(_pHV_,"major_version"), (IV)status->major_version);
	;
	sv_setiv(__fetchmember(_pHV_,"minor_version"), (IV)status->minor_version);
	;
	sv_setiv(__fetchmember(_pHV_,"code"), (IV)status->code);
	;
	sv_setiv(__fetchmember(_pHV_,"klass"), (IV)status->klass);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"reason_phrase"), status->reason_phrase);
	;

        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_lock_walkfunc set by dav_lock_iterate *** */

void neon_cb___cb__18 (struct dav_lock *lock, void *userdata)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__18", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&lock), sizeof(lock), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Lock", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)lock), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);
	pSV = (SV *)userdata;
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_props_result set by dav_propnames *** */

void neon_cb___cb__3 (void *userdata, const char *href,
				 const dav_prop_result_set *results)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__3", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, href);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&results), sizeof(results), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Propset", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)results), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_props_result set by dav_propfind_allprop *** */

void neon_cb___cb__21 (void *userdata, const char *href,
				 const dav_prop_result_set *results)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__21", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, href);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&results), sizeof(results), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Propset", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)results), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_props_result set by dav_propfind_named *** */

void neon_cb___cb__22 (void *userdata, const char *href,
				 const dav_prop_result_set *results)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__22", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, href);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&results), sizeof(results), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Propset", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)results), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_props_result set by dav_simple_propfind *** */

void neon_cb___cb__4 (void *userdata, const char *href,
				 const dav_prop_result_set *results)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__4", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, href);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&results), sizeof(results), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Propset", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)results), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** dav_propset_iterator set by dav_propset_iterate *** */

int neon_cb___cb__23 (void *userdata,
				    const dav_propname *pname,
				    const char *value,
				    const http_status *status)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__23", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;

        /* croak ("pname unsupported") ; */
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("pname must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setpv((SV*)__fetchmember(_pHV_,"nspace"), pname->nspace);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"name"), pname->name);
	;

        }
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, value);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("status must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setiv(__fetchmember(_pHV_,"major_version"), (IV)status->major_version);
	;
	sv_setiv(__fetchmember(_pHV_,"minor_version"), (IV)status->minor_version);
	;
	sv_setiv(__fetchmember(_pHV_,"code"), (IV)status->code);
	;
	sv_setiv(__fetchmember(_pHV_,"klass"), (IV)status->klass);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"reason_phrase"), status->reason_phrase);
	;

        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** hip_xml_cdata_cb set by hip_xml_push_mixed_handler *** */

void neon_cb___cb__16 (void *userdata, const struct hip_xml_elm *s, 
     const char *cdata, int len)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__16", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	sv_setiv(pSV, (IV)s);	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, cdata);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)len);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** hip_xml_endelm_cb set by hip_xml_push_handler *** */

int neon_cb___cb__14 (void *userdata, const struct hip_xml_elm *s, const char *cdata)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__14", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	sv_setiv(pSV, (IV)s);	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, cdata);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** hip_xml_endelm_cb set by hip_xml_push_mixed_handler *** */

int neon_cb___cb__17 (void *userdata, const struct hip_xml_elm *s, const char *cdata)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__17", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	sv_setiv(pSV, (IV)s);	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, cdata);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** hip_xml_startelm_cb set by hip_xml_push_handler *** */

int neon_cb___cb__13 (void *userdata, const struct hip_xml_elm *elm, const char **atts)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__13", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	sv_setiv(pSV, (IV)elm);	XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** hip_xml_startelm_cb set by hip_xml_push_mixed_handler *** */

int neon_cb___cb__15 (void *userdata, const struct hip_xml_elm *elm, const char **atts)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__15", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	sv_setiv(pSV, (IV)elm);	XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** http_accept_response set by http_add_response_body_reader *** */

int neon_cb___cb__24 (
    void *userdata, http_req *req, http_status *st)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__24", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        SV ** ppArg ;
        ppArg = hv_fetch (pC2Perl, (char *)(&req), sizeof(req), 1) ;
        if (!SvOK(*ppArg))
            {
            SV * pObj ;
            *ppArg = newRV_noinc ((SV *)newHV()) ;
	    sv_bless (*ppArg, gv_stashpv ("Net::Webdav::Request", 0)) ;
            hv_store (pPerl2C, (char *)(SvRV (*ppArg)), sizeof (PV), newSViv ((IV)req), 0) ;
            }
        pSV = *ppArg ;
        }
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("st must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setiv(__fetchmember(_pHV_,"major_version"), (IV)st->major_version);
	;
	sv_setiv(__fetchmember(_pHV_,"minor_version"), (IV)st->minor_version);
	;
	sv_setiv(__fetchmember(_pHV_,"code"), (IV)st->code);
	;
	sv_setiv(__fetchmember(_pHV_,"klass"), (IV)st->klass);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"reason_phrase"), st->reason_phrase);
	;

        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** http_block_reader set by http_read_file *** */

void neon_cb___cb__6 (
    void *userdata, const char *buf, size_t len)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__6", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, buf);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)len);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_block_reader set by http_add_response_body_reader *** */

void neon_cb___cb__25 (
    void *userdata, const char *buf, size_t len)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__25", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, buf);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)len);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_free_hooks set by http_add_hooks *** */

void neon_cb___cb__1 (void *cookie)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)cookie), "__cb__1", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)cookie;
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_header_handler set by http_add_response_header_catcher *** */

void neon_cb___cb__26 (void *userdata, const char *value)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__26", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, value);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_header_handler set by http_add_response_header_handler *** */

void neon_cb___cb__27 (void *userdata, const char *value)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__27", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, value);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_notify_status set by http_set_status *** */

void neon_cb___cb__12 (void *userdata, 
				   http_conn_status status,
				   const char *info)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__12", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, info);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_provide_body set by http_set_request_body_provider *** */

size_t neon_cb___cb__28 (void *userdata, 
				    char *buffer, size_t buflen)
    {
	size_t retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__28", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, buffer);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)buflen);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (size_t)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** http_redirect_confirm set by http_redirect_register *** */

int neon_cb___cb__7 (void *userdata,
				     const char *src, const char *dest)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__7", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, src);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, dest);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** http_redirect_notify set by http_redirect_register *** */

void neon_cb___cb__8 (void *userdata,
				     const char *src, const char *dest)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__8", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, src);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, dest);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** http_request_auth set by http_set_proxy_auth *** */

int neon_cb___cb__10 (
    void *userdata, const char *realm,
    char **username, char **password)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__10", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, realm);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_ARRAY) ;
		}
	SPAGAIN ; 
	
    if (cnt < 2)
        retval = -1 ;
    else
        {
        SV * pPassword = POPs ;
        SV * pUsername = POPs ;
        char * s ;
        STRLEN l ;
        s = SvPV (pUsername, l) ;
        *username = malloc (l + 1) ;
        strcpy (*username, s) ;
        s = SvPV (pPassword, l) ;
        *password = malloc (l + 1) ;
        strcpy (*password, s) ;
        retval = 0 ;
        }
 ;
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** http_request_auth set by http_set_server_auth *** */

int neon_cb___cb__11 (
    void *userdata, const char *realm,
    char **username, char **password)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__11", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, realm);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);
	pSV = sv_newmortal ();
		XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_ARRAY) ;
		}
	SPAGAIN ; 
	
    if (cnt < 2)
        retval = -1 ;
    else
        {
        SV * pPassword = POPs ;
        SV * pUsername = POPs ;
        char * s ;
        STRLEN l ;
        s = SvPV (pUsername, l) ;
        *username = malloc (l + 1) ;
        strcpy (*username, s) ;
        s = SvPV (pPassword, l) ;
        *password = malloc (l + 1) ;
        strcpy (*password, s) ;
        retval = 0 ;
        }
 ;
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** http_use_proxy set by http_session_decide_proxy *** */

int neon_cb___cb__5 (void *userdata,
			      const char *scheme, const char *hostname)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__5", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, scheme);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, hostname);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** nssl_accept set by sock_set_cert_accept *** */

int neon_cb___cb__29 (void *userdata, const nssl_certificate *info)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__29", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
	
        {
        HV * _pHV_ ;
        if (!SvOK(pSV))
            {
            pSV = newRV_noinc((SV *)(_pHV_ = newHV())) ;
            sv_2mortal (pSV) ;
            }
        else if (!SvROK (pSV))
            {
            croak ("info must be a reference") ;
            }
        else if (SvTYPE(_pHV_ = (HV *)SvRV(pSV)) != SVt_PVHV)
	    SvUPGRADE ((SV *)_pHV_, SVt_PVHV) ;
	sv_setpv((SV*)__fetchmember(_pHV_,"owner"), info->owner);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"issuer"), info->issuer);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"valid_from"), info->valid_from);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"valid_till"), info->valid_till);
	;
	sv_setpv((SV*)__fetchmember(_pHV_,"fingerprint"), info->fingerprint);
	;

        }
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** nssl_key_prompt set by sock_set_key_prompt *** */

int neon_cb___cb__30 (void *userdata, const char *filename,
			       char *buf, int buflen)
    {
	int retval ;

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__30", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, filename);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, buf);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)buflen);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_SCALAR) ;
		}

    SPAGAIN ;
    if (cnt != 1)
        {
        retval = 0 ;
        }
    else
        {
        pSV = POPs ;
	retval = (int)SvIV(pSV);
	}
	PUTBACK ;

    FREETMPS ;
    LEAVE ;
	return retval ;

    }

    
    /* *** sock_block_reader set by sock_readfile_blocked *** */

void neon_cb___cb__31 (
    void *userdata, const char *buf, size_t len)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__31", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setpv((SV*)pSV, buf);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)len);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** sock_progress set by http_set_progress *** */

void neon_cb___cb__9 (void *userdata, off_t progress, off_t total)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__9", 7, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)progress);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)total);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }

    
    /* *** sock_progress set by sock_register_progress *** */

void neon_cb___cb__32 (void *userdata, off_t progress, off_t total)
    {

    int cnt ;
    SV * pSV ;
    SV ** ppCV ;

    dSP ;
    ENTER ;
    SAVETMPS ;
    PUSHMARK(SP) ;

    ppCV = hv_fetch ((HV *)SvRV((SV *)userdata), "__cb__32", 8, 0) ;
    if (ppCV && *ppCV)
        {
	pSV = (SV *)userdata;
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)progress);
	XPUSHs(pSV);
	pSV = sv_newmortal ();
		sv_setiv(pSV, (IV)total);
	XPUSHs(pSV);

    PUTBACK ;
		cnt = perl_call_sv (*ppCV, G_VOID) ;
		}

    FREETMPS ;
    LEAVE ;

    }



MODULE = Net::Webdav         PACKAGE = Net::Webdav


void
add_hooks(sess,hooks,free_cookie)
	http_session * sess
	const http_request_hooks * hooks
	CV * free_cookie

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (free_cookie)
                {
                SvREFCNT_inc ((SV *)free_cookie) ;
                hv_store (pObjHV, "__cb__1", 7, (SV *)free_cookie, 0) ; 
                }
	http_add_hooks(sess,hooks,pObject,free_cookie?&neon_cb___cb__1:NULL);


int
dav_copy(sess,overwrite,src,dest)
	http_session * sess
	int overwrite
	const char * src
	const char * dest


int
dav_delete(sess,uri)
	http_session * sess
	const char * uri


int
dav_lock(sess,lock)
	http_session * sess
	struct dav_lock * lock


int
dav_lock_discover(sess,uri,result)
	http_session * sess
	const char * uri
	CV * result

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (result)
                {
                SvREFCNT_inc ((SV *)result) ;
                hv_store (pObjHV, "__cb__2", 7, (SV *)result, 0) ; 
                }
	RETVAL = 	dav_lock_discover(sess,uri,result?&neon_cb___cb__2:NULL,pObject);
OUTPUT:
	RETVAL


dav_lock_session *
dav_lock_register(sess)
	http_session * sess


int
dav_mkcol(sess,uri)
	http_session * sess
	const char * uri


int
dav_move(sess,overwrite,src,dest)
	http_session * sess
	int overwrite
	const char * src
	const char * dest


dav_propfind_handler *
dav_propfind_create(sess,uri,depth)
	http_session * sess
	const char * uri
	int depth


int
dav_propnames(sess,href,depth,results)
	http_session * sess
	const char * href
	int depth
	CV * results

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (results)
                {
                SvREFCNT_inc ((SV *)results) ;
                hv_store (pObjHV, "__cb__3", 7, (SV *)results, 0) ; 
                }
	RETVAL = 	dav_propnames(sess,href,depth,results?&neon_cb___cb__3:NULL,pObject);
OUTPUT:
	RETVAL


int
dav_proppatch(sess,uri,items)
	http_session * sess
	const char * uri
	const dav_proppatch_operation * items


int
dav_simple_propfind(sess,uri,depth,props,results)
	http_session * sess
	const char * uri
	int depth
	const dav_propname * props
	CV * results

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (results)
                {
                SvREFCNT_inc ((SV *)results) ;
                hv_store (pObjHV, "__cb__4", 7, (SV *)results, 0) ; 
                }
	RETVAL = 	dav_simple_propfind(sess,uri,depth,props,results?&neon_cb___cb__4:NULL,pObject);
OUTPUT:
	RETVAL


int
dav_simple_request(sess,req)
	http_session * sess
	http_req * req


int
dav_unlock(sess,lock)
	http_session * sess
	struct dav_lock * lock


void
decide_proxy(sess,use_proxy)
	http_session * sess
	CV * use_proxy

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (use_proxy)
                {
                SvREFCNT_inc ((SV *)use_proxy) ;
                hv_store (pObjHV, "__cb__5", 7, (SV *)use_proxy, 0) ; 
                }
	http_session_decide_proxy(sess,use_proxy?&neon_cb___cb__5:NULL,pObject);


int
destroy(sess)
	http_session * sess
CODE:
	RETVAL = 	http_session_destroy(sess);
OUTPUT:
	RETVAL


void
forget_auth(sess)
	http_session * sess
CODE:
	http_forget_auth(sess);


int
get(sess,uri,f)
	http_session * sess
	const char * uri
	FILE * f
CODE:
	RETVAL = 	http_get(sess,uri,f);
OUTPUT:
	RETVAL


const char *
get_error(sess)
	http_session * sess
CODE:
	RETVAL = 	http_get_error(sess);
OUTPUT:
	RETVAL


int
get_range(sess,uri,range,f)
	http_session * sess
	const char * uri
	http_content_range * range
	FILE * f
CODE:
	RETVAL = 	http_get_range(sess,uri,range,f);
OUTPUT:
	RETVAL


const char *
get_scheme(sess)
	http_session * sess
CODE:
	RETVAL = 	http_get_scheme(sess);
OUTPUT:
	RETVAL


const char *
get_server_hostport(sess)
	http_session * sess
CODE:
	RETVAL = 	http_get_server_hostport(sess);
OUTPUT:
	RETVAL


int
getmodtime(sess,uri,modtime)
	http_session * sess
	const char * uri
	time_t * modtime
CODE:
	RETVAL = 	http_getmodtime(sess,uri,modtime);
OUTPUT:
	RETVAL


void *
hook_private(sess,id)
	http_session * sess
	const char * id
CODE:
	RETVAL = 	http_session_hook_private(sess,id);
OUTPUT:
	RETVAL


int
options(sess,uri,caps)
	http_session * sess
	const char * uri
	http_server_capabilities * caps
CODE:
	RETVAL = 	http_options(sess,uri,caps);
OUTPUT:
	RETVAL


int
post(sess,uri,f,buffer)
	http_session * sess
	const char * uri
	FILE * f
	const char * buffer
CODE:
	RETVAL = 	http_post(sess,uri,f,buffer);
OUTPUT:
	RETVAL


int
proxy(sess,hostname,port)
	http_session * sess
	const char * hostname
	int port
CODE:
	RETVAL = 	http_session_proxy(sess,hostname,port);
OUTPUT:
	RETVAL


int
put(sess,uri,f)
	http_session * sess
	const char * uri
	FILE * f
CODE:
	RETVAL = 	http_put(sess,uri,f);
OUTPUT:
	RETVAL


int
put_if_unmodified(sess,uri,stream,modtime)
	http_session * sess
	const char * uri
	FILE * stream
	time_t modtime
CODE:
	RETVAL = 	http_put_if_unmodified(sess,uri,stream,modtime);
OUTPUT:
	RETVAL


int
read_file(sess,uri,reader)
	http_session * sess
	const char * uri
	CV * reader

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (reader)
                {
                SvREFCNT_inc ((SV *)reader) ;
                hv_store (pObjHV, "__cb__6", 7, (SV *)reader, 0) ; 
                }
	RETVAL = 	http_read_file(sess,uri,reader?&neon_cb___cb__6:NULL,pObject);
OUTPUT:
	RETVAL


const char *
redirect_location(sess)
	http_session * sess
CODE:
	RETVAL = 	http_redirect_location(sess);
OUTPUT:
	RETVAL


void
redirect_register(sess,confirm,notify)
	http_session * sess
	CV * confirm
	CV * notify

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (confirm)
                {
                SvREFCNT_inc ((SV *)confirm) ;
                hv_store (pObjHV, "__cb__7", 7, (SV *)confirm, 0) ; 
                }

            if (notify)
                {
                SvREFCNT_inc ((SV *)notify) ;
                hv_store (pObjHV, "__cb__8", 7, (SV *)notify, 0) ; 
                }
	http_redirect_register(sess,confirm?&neon_cb___cb__7:NULL,notify?&neon_cb___cb__8:NULL,pObject);


http_req *
request_create(sess,method,uri)
	http_session * sess
	const char * method
	const char * uri
CODE:
	RETVAL = 	http_request_create(sess,method,uri);
OUTPUT:
	RETVAL


int
server(sess,hostname,port)
	http_session * sess
	const char * hostname
	int port
CODE:
	RETVAL = 	http_session_server(sess,hostname,port);
OUTPUT:
	RETVAL


int
set_accept_secure_upgrade(sess,acc_upgrade)
	http_session * sess
	int acc_upgrade
CODE:
	RETVAL = 	http_set_accept_secure_upgrade(sess,acc_upgrade);
OUTPUT:
	RETVAL


void
set_error(sess,errstring)
	http_session * sess
	const char * errstring
CODE:
	http_set_error(sess,errstring);


void
set_expect100(sess,use_expect100)
	http_session * sess
	int use_expect100
CODE:
	http_set_expect100(sess,use_expect100);


void
set_persist(sess,persist)
	http_session * sess
	int persist
CODE:
	http_set_persist(sess,persist);


void
set_progress(sess,progress)
	http_session * sess
	CV * progress

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (progress)
                {
                SvREFCNT_inc ((SV *)progress) ;
                hv_store (pObjHV, "__cb__9", 7, (SV *)progress, 0) ; 
                }
	http_set_progress(sess,progress?&neon_cb___cb__9:NULL,pObject);


void
set_proxy_auth(sess,callback)
	http_session * sess
	CV * callback

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (callback)
                {
                SvREFCNT_inc ((SV *)callback) ;
                hv_store (pObjHV, "__cb__10", 8, (SV *)callback, 0) ; 
                }
	http_set_proxy_auth(sess,callback?&neon_cb___cb__10:NULL,pObject);


int
set_request_secure_upgrade(sess,req_upgrade)
	http_session * sess
	int req_upgrade
CODE:
	RETVAL = 	http_set_request_secure_upgrade(sess,req_upgrade);
OUTPUT:
	RETVAL


int
set_secure(sess,secure)
	http_session * sess
	int secure
CODE:
	RETVAL = 	http_set_secure(sess,secure);
OUTPUT:
	RETVAL


void
set_secure_context(sess,ctx)
	http_session * sess
	nssl_context * ctx
CODE:
	http_set_secure_context(sess,ctx);


void
set_server_auth(sess,callback)
	http_session * sess
	CV * callback

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (callback)
                {
                SvREFCNT_inc ((SV *)callback) ;
                hv_store (pObjHV, "__cb__11", 8, (SV *)callback, 0) ; 
                }
	http_set_server_auth(sess,callback?&neon_cb___cb__11:NULL,pObject);


void
set_status(sess,status)
	http_session * sess
	CV * status

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (status)
                {
                SvREFCNT_inc ((SV *)status) ;
                hv_store (pObjHV, "__cb__12", 8, (SV *)status, 0) ; 
                }
	http_set_status(sess,status?&neon_cb___cb__12:NULL,pObject);


void
set_useragent(sess,product)
	http_session * sess
	const char * product
CODE:
	http_set_useragent(sess,product);


int
version_pre_http11(sess)
	http_session * sess
CODE:
	RETVAL = 	http_version_pre_http11(sess);
OUTPUT:
	RETVAL

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Hip


dav_207_parser *
dav_207_create(parser)
	hip_xml_parser * parser

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:
	RETVAL = 	dav_207_create(parser,pObject);
OUTPUT:
	RETVAL


int
xml_currentline(p)
	hip_xml_parser * p
CODE:
	RETVAL = 	hip_xml_currentline(p);
OUTPUT:
	RETVAL


void
xml_destroy(p)
	hip_xml_parser * p
CODE:
	hip_xml_destroy(p);


const char *
xml_get_error(p)
	hip_xml_parser * p
CODE:
	RETVAL = 	hip_xml_get_error(p);
OUTPUT:
	RETVAL


void
xml_parse(p,block,len)
	hip_xml_parser * p
	const char * block
	size_t len
CODE:
	hip_xml_parse(p,block,len);


void
xml_push_handler(p,elements,validate_cb,startelm_cb,endelm_cb)
	hip_xml_parser * p
	const struct hip_xml_elm * elements
	hip_xml_validate_cb validate_cb
	CV * startelm_cb
	CV * endelm_cb

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (startelm_cb)
                {
                SvREFCNT_inc ((SV *)startelm_cb) ;
                hv_store (pObjHV, "__cb__13", 8, (SV *)startelm_cb, 0) ; 
                }

            if (endelm_cb)
                {
                SvREFCNT_inc ((SV *)endelm_cb) ;
                hv_store (pObjHV, "__cb__14", 8, (SV *)endelm_cb, 0) ; 
                }
	hip_xml_push_handler(p,elements,validate_cb,startelm_cb?&neon_cb___cb__13:NULL,endelm_cb?&neon_cb___cb__14:NULL,pObject);


void
xml_push_mixed_handler(p,elements,validate_cb,startelm_cb,cdata_cb,endelm_cb)
	hip_xml_parser * p
	const struct hip_xml_elm * elements
	hip_xml_validate_cb validate_cb
	CV * startelm_cb
	CV * cdata_cb
	CV * endelm_cb

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (startelm_cb)
                {
                SvREFCNT_inc ((SV *)startelm_cb) ;
                hv_store (pObjHV, "__cb__15", 8, (SV *)startelm_cb, 0) ; 
                }

            if (cdata_cb)
                {
                SvREFCNT_inc ((SV *)cdata_cb) ;
                hv_store (pObjHV, "__cb__16", 8, (SV *)cdata_cb, 0) ; 
                }

            if (endelm_cb)
                {
                SvREFCNT_inc ((SV *)endelm_cb) ;
                hv_store (pObjHV, "__cb__17", 8, (SV *)endelm_cb, 0) ; 
                }
	hip_xml_push_mixed_handler(p,elements,validate_cb,startelm_cb?&neon_cb___cb__15:NULL,cdata_cb?&neon_cb___cb__16:NULL,endelm_cb?&neon_cb___cb__17:NULL,pObject);


void
xml_set_error(p,msg)
	hip_xml_parser * p
	const char * msg
CODE:
	hip_xml_set_error(p,msg);


int
xml_valid(p)
	hip_xml_parser * p
CODE:
	RETVAL = 	hip_xml_valid(p);
OUTPUT:
	RETVAL

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Lock


struct dav_lock *
copy(lock)
	const struct dav_lock * lock
CODE:
	RETVAL = 	dav_lock_copy(lock);
OUTPUT:
	RETVAL


void
free(lock)
	struct dav_lock * lock
CODE:
	dav_lock_free(lock);

MODULE = Net::Webdav         PACKAGE = Net::Webdav::LockSession


void
add(sess,lock)
	dav_lock_session * sess
	struct dav_lock * lock
CODE:
	dav_lock_add(sess,lock);


struct dav_lock *
find(sess,uri)
	dav_lock_session * sess
	const char * uri
CODE:
	RETVAL = 	dav_lock_find(sess,uri);
OUTPUT:
	RETVAL


int
iterate(sess,func)
	dav_lock_session * sess
	CV * func

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (func)
                {
                SvREFCNT_inc ((SV *)func) ;
                hv_store (pObjHV, "__cb__18", 8, (SV *)func, 0) ; 
                }
	RETVAL = 	dav_lock_iterate(sess,func?&neon_cb___cb__18:NULL,pObject);
OUTPUT:
	RETVAL


void
remove(sess,lock)
	dav_lock_session * sess
	struct dav_lock * lock
CODE:
	dav_lock_remove(sess,lock);

MODULE = Net::Webdav         PACKAGE = Net::Webdav::MD5


void *
finish_ctx(ctx,resbuf)
	struct ne_md5_ctx * ctx
	void * resbuf
CODE:
	RETVAL = 	ne_md5_finish_ctx(ctx,resbuf);
OUTPUT:
	RETVAL


void
init_ctx(ctx)
	struct ne_md5_ctx * ctx
CODE:
	ne_md5_init_ctx(ctx);

MODULE = Net::Webdav         PACKAGE = Net::Webdav::MultiStatus


void
destroy(p)
	dav_207_parser * p
CODE:
	dav_207_destroy(p);


void *
get_current_propstat(p)
	dav_207_parser * p
CODE:
	RETVAL = 	dav_207_get_current_propstat(p);
OUTPUT:
	RETVAL


void *
get_current_response(p)
	dav_207_parser * p
CODE:
	RETVAL = 	dav_207_get_current_response(p);
OUTPUT:
	RETVAL


void
ignore_unknown(p)
	dav_207_parser * p
CODE:
	dav_207_ignore_unknown(p);


void
set_propstat_handlers(p,start,end)
	dav_207_parser * p
	dav_207_start_propstat start
	CV * end

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (end)
                {
                SvREFCNT_inc ((SV *)end) ;
                hv_store (pObjHV, "__cb__19", 8, (SV *)end, 0) ; 
                }
	dav_207_set_propstat_handlers(p,start,end?&neon_cb___cb__19:NULL);


void
set_response_handlers(p,start,end)
	dav_207_parser * p
	dav_207_start_response start
	CV * end

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (end)
                {
                SvREFCNT_inc ((SV *)end) ;
                hv_store (pObjHV, "__cb__20", 8, (SV *)end, 0) ; 
                }
	dav_207_set_response_handlers(p,start,end?&neon_cb___cb__20:NULL);

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Propfind


int
allprop(handler,result)
	dav_propfind_handler * handler
	CV * result

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (result)
                {
                SvREFCNT_inc ((SV *)result) ;
                hv_store (pObjHV, "__cb__21", 8, (SV *)result, 0) ; 
                }
	RETVAL = 	dav_propfind_allprop(handler,result?&neon_cb___cb__21:NULL,pObject);
OUTPUT:
	RETVAL


void *
current_private(handler)
	dav_propfind_handler * handler
CODE:
	RETVAL = 	dav_propfind_current_private(handler);
OUTPUT:
	RETVAL


void
destroy(handler)
	dav_propfind_handler * handler
CODE:
	dav_propfind_destroy(handler);


hip_xml_parser *
get_parser(handler)
	dav_propfind_handler * handler
CODE:
	RETVAL = 	dav_propfind_get_parser(handler);
OUTPUT:
	RETVAL


http_req *
get_request(handler)
	dav_propfind_handler * handler
CODE:
	RETVAL = 	dav_propfind_get_request(handler);
OUTPUT:
	RETVAL


int
named(handler,prop,result)
	dav_propfind_handler * handler
	const dav_propname * prop
	CV * result

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (result)
                {
                SvREFCNT_inc ((SV *)result) ;
                hv_store (pObjHV, "__cb__22", 8, (SV *)result, 0) ; 
                }
	RETVAL = 	dav_propfind_named(handler,prop,result?&neon_cb___cb__22:NULL,pObject);
OUTPUT:
	RETVAL


void
set_private(handler,creator,userdata)
	dav_propfind_handler * handler
	dav_props_create_complex creator
	void * userdata
CODE:
	dav_propfind_set_private(handler,creator,userdata);

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Propset


int
iterate(set,iterator)
	const dav_prop_result_set * set
	CV * iterator

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (iterator)
                {
                SvREFCNT_inc ((SV *)iterator) ;
                hv_store (pObjHV, "__cb__23", 8, (SV *)iterator, 0) ; 
                }
	RETVAL = 	dav_propset_iterate(set,iterator?&neon_cb___cb__23:NULL,pObject);
OUTPUT:
	RETVAL


const char *
lang(set,pname)
	const dav_prop_result_set * set
	const dav_propname * pname
CODE:
	RETVAL = 	dav_propset_lang(set,pname);
OUTPUT:
	RETVAL


void *
private(set)
	const dav_prop_result_set * set
CODE:
	RETVAL = 	dav_propset_private(set);
OUTPUT:
	RETVAL


const http_status *
status(set,propname)
	const dav_prop_result_set * set
	const dav_propname * propname
CODE:
	RETVAL = 	dav_propset_status(set,propname);
OUTPUT:
	RETVAL


const char *
value(set,propname)
	const dav_prop_result_set * set
	const dav_propname * propname
CODE:
	RETVAL = 	dav_propset_value(set,propname);
OUTPUT:
	RETVAL

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Request


void
add_request_header(req,name,value)
	http_req * req
	const char * name
	const char * value
CODE:
	http_add_request_header(req,name,value);


void
add_response_body_reader(req,accpt,rdr)
	http_req * req
	CV * accpt
	CV * rdr

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (accpt)
                {
                SvREFCNT_inc ((SV *)accpt) ;
                hv_store (pObjHV, "__cb__24", 8, (SV *)accpt, 0) ; 
                }

            if (rdr)
                {
                SvREFCNT_inc ((SV *)rdr) ;
                hv_store (pObjHV, "__cb__25", 8, (SV *)rdr, 0) ; 
                }
	http_add_response_body_reader(req,accpt?&neon_cb___cb__24:NULL,rdr?&neon_cb___cb__25:NULL,pObject);


void
add_response_header_catcher(req,hdl)
	http_req * req
	CV * hdl

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (hdl)
                {
                SvREFCNT_inc ((SV *)hdl) ;
                hv_store (pObjHV, "__cb__26", 8, (SV *)hdl, 0) ; 
                }
	http_add_response_header_catcher(req,hdl?&neon_cb___cb__26:NULL,pObject);


void
add_response_header_handler(req,name,hdl)
	http_req * req
	const char * name
	CV * hdl

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (hdl)
                {
                SvREFCNT_inc ((SV *)hdl) ;
                hv_store (pObjHV, "__cb__27", 8, (SV *)hdl, 0) ; 
                }
	http_add_response_header_handler(req,name,hdl?&neon_cb___cb__27:NULL,pObject);


int
begin_request(req)
	http_req * req
CODE:
	RETVAL = 	http_begin_request(req);
OUTPUT:
	RETVAL


void
dav_add_depth_header(req,depth)
	http_req * req
	int depth


void
dav_lock_using_parent(req,uri)
	http_req * req
	const char * uri


void
dav_lock_using_resource(req,uri,depth)
	http_req * req
	const char * uri
	int depth


int
end_request(req)
	http_req * req
CODE:
	RETVAL = 	http_end_request(req);
OUTPUT:
	RETVAL


sbuffer
get_request_headers(req)
	http_req * req
CODE:
	RETVAL = 	http_get_request_headers(req);
OUTPUT:
	RETVAL


const http_status *
get_status(req)
	http_req * req
CODE:
	RETVAL = 	http_get_status(req);
OUTPUT:
	RETVAL


ssize_t
read_response_block(req,buffer,buflen)
	http_req * req
	char * buffer
	size_t buflen
CODE:
	RETVAL = 	http_read_response_block(req,buffer,buflen);
OUTPUT:
	RETVAL


void
request_destroy(req)
	http_req * req
CODE:
	http_request_destroy(req);


int
request_dispatch(req)
	http_req * req
CODE:
	RETVAL = 	http_request_dispatch(req);
OUTPUT:
	RETVAL


void *
request_hook_private(req,id)
	http_req * req
	const char * id
CODE:
	RETVAL = 	http_request_hook_private(req,id);
OUTPUT:
	RETVAL


void
set_request_body_buffer(req,buffer,size)
	http_req * req
	const char * buffer
	size_t size
CODE:
	http_set_request_body_buffer(req,buffer,size);


void
set_request_body_provider(req,size,provider)
	http_req * req
	size_t size
	CV * provider

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (provider)
                {
                SvREFCNT_inc ((SV *)provider) ;
                hv_store (pObjHV, "__cb__28", 8, (SV *)provider, 0) ; 
                }
	http_set_request_body_provider(req,size,provider?&neon_cb___cb__28:NULL,pObject);


int
set_request_body_stream(req,stream)
	http_req * req
	FILE * stream
CODE:
	RETVAL = 	http_set_request_body_stream(req,stream);
OUTPUT:
	RETVAL

MODULE = Net::Webdav         PACKAGE = Net::Webdav::SSL


void
destroy_ssl_context(ctx)
	nssl_context * ctx
CODE:
	sock_destroy_ssl_context(ctx);


void
disable_sslv2(c)
	nssl_context * c
CODE:
	sock_disable_sslv2(c);


void
disable_sslv3(c)
	nssl_context * c
CODE:
	sock_disable_sslv3(c);


void
disable_tlsv1(c)
	nssl_context * c
CODE:
	sock_disable_tlsv1(c);


void
set_cert_accept(c,accepter)
	nssl_context * c
	CV * accepter

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (accepter)
                {
                SvREFCNT_inc ((SV *)accepter) ;
                hv_store (pObjHV, "__cb__29", 8, (SV *)accepter, 0) ; 
                }
	sock_set_cert_accept(c,accepter?&neon_cb___cb__29:NULL,pObject);


int
set_client_cert(ctx,certfile,keyfile)
	nssl_context * ctx
	const char * certfile
	const char * keyfile
CODE:
	RETVAL = 	sock_set_client_cert(ctx,certfile,keyfile);
OUTPUT:
	RETVAL


void
set_key_prompt(c,prompt)
	nssl_context * c
	CV * prompt

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (prompt)
                {
                SvREFCNT_inc ((SV *)prompt) ;
                hv_store (pObjHV, "__cb__30", 8, (SV *)prompt, 0) ; 
                }
	sock_set_key_prompt(c,prompt?&neon_cb___cb__30:NULL,pObject);

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Socket


int
block(sock,timeout)
	nsocket * sock
	int timeout
CODE:
	RETVAL = 	sock_block(sock,timeout);
OUTPUT:
	RETVAL


void
call_progress(sock,progress,total)
	nsocket * sock
	off_t progress
	off_t total
CODE:
	sock_call_progress(sock,progress,total);


int
close(sock)
	nsocket * sock
CODE:
	RETVAL = 	sock_close(sock);
OUTPUT:
	RETVAL


int
fullread(sock,buffer,buflen)
	nsocket * sock
	char * buffer
	int buflen
CODE:
	RETVAL = 	sock_fullread(sock,buffer,buflen);
OUTPUT:
	RETVAL


int
fullwrite(sock,data,length)
	nsocket * sock
	const char * data
	size_t length
CODE:
	RETVAL = 	sock_fullwrite(sock,data,length);
OUTPUT:
	RETVAL


const char *
get_error(sock)
	nsocket * sock
CODE:
	RETVAL = 	sock_get_error(sock);
OUTPUT:
	RETVAL


int
get_fd(sock)
	nsocket * sock
CODE:
	RETVAL = 	sock_get_fd(sock);
OUTPUT:
	RETVAL


const char *
get_version(sock)
	nsocket * sock
CODE:
	RETVAL = 	sock_get_version(sock);
OUTPUT:
	RETVAL


int
make_secure(sock,ctx)
	nsocket * sock
	nssl_context * ctx
CODE:
	RETVAL = 	sock_make_secure(sock,ctx);
OUTPUT:
	RETVAL


int
peek(sock,buffer,count)
	nsocket * sock
	char * buffer
	size_t count
CODE:
	RETVAL = 	sock_peek(sock,buffer,count);
OUTPUT:
	RETVAL


int
read(sock,buffer,count)
	nsocket * sock
	char * buffer
	size_t count
CODE:
	RETVAL = 	sock_read(sock,buffer,count);
OUTPUT:
	RETVAL


int
readfile_blocked(sock,length,reader)
	nsocket * sock
	off_t length
	CV * reader

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (reader)
                {
                SvREFCNT_inc ((SV *)reader) ;
                hv_store (pObjHV, "__cb__31", 8, (SV *)reader, 0) ; 
                }
	RETVAL = 	sock_readfile_blocked(sock,length,reader?&neon_cb___cb__31:NULL,pObject);
OUTPUT:
	RETVAL


int
readline(sock,line,len)
	nsocket * sock
	char * line
	int len
CODE:
	RETVAL = 	sock_readline(sock,line,len);
OUTPUT:
	RETVAL


void
register_progress(sock,cb)
	nsocket * sock
	CV * cb

        PREINIT:
            SV * pObject = ST(0) ;
            HV * pObjHV  = (HV *)SvRV(pObject) ;
        CODE:

            if (cb)
                {
                SvREFCNT_inc ((SV *)cb) ;
                hv_store (pObjHV, "__cb__32", 8, (SV *)cb, 0) ; 
                }
	sock_register_progress(sock,cb?&neon_cb___cb__32:NULL,pObject);


int
send_string(sock,string)
	nsocket * sock
	const char * string
CODE:
	RETVAL = 	sock_send_string(sock,string);
OUTPUT:
	RETVAL


int
sendline(sock,line)
	nsocket * sock
	const char * line
CODE:
	RETVAL = 	sock_sendline(sock,line);
OUTPUT:
	RETVAL

MODULE = Net::Webdav         PACKAGE = Net::Webdav::Util


int
dav_accept_207(userdata,req,status)
	void * userdata
	http_req * req
	http_status * status


hip_xml_parser *
hip_xml_create()


void
hip_xml_parse_v(userdata,block,len)
	void * userdata
	const char * block
	size_t len


int
http_accept_2xx(userdata,req,st)
	void * userdata
	http_req * req
	http_status * st


int
http_accept_always(userdata,req,st)
	void * userdata
	http_req * req
	http_status * st


void
http_content_type_handler(userdata,value)
	void * userdata
	const char * value


time_t
http_dateparse(date)
	const char * date


void
http_duplicate_header(userdata,value)
	void * userdata
	const char * value


void
http_handle_numeric_header(userdata,value)
	void * userdata
	const char * value


int
http_parse_statusline(status_line,s)
	const char * status_line
	http_status * s


http_session *
http_session_create()


time_t
ne_asctime_parse(date)
	const char * date


void *
ne_calloc(len)
	size_t len


void *
ne_md5_buffer(buffer,len,resblock)
	const char * buffer
	size_t len
	void * resblock


void
ne_md5_process_block(buffer,len,ctx)
	const void * buffer
	size_t len
	struct ne_md5_ctx * ctx


void
ne_md5_process_bytes(buffer,len,ctx)
	const void * buffer
	size_t len
	struct ne_md5_ctx * ctx


void *
ne_md5_read_ctx(ctx,resbuf)
	const struct ne_md5_ctx * ctx
	void * resbuf


int
ne_md5_stream(stream,resblock)
	FILE * stream
	void * resblock


void *
ne_realloc(ptr,len)
	void * ptr
	size_t len


time_t
ne_rfc1036_parse(date)
	const char * date


char *
ne_rfc1123_date(anytime)
	time_t anytime


time_t
ne_rfc1123_parse(date)
	const char * date


char *
ne_strdup(s)
	const char * s


char *
ne_strndup(s,n)
	const char * s
	size_t n


char *
ne_utf8_decode(str)
	const char * str


char *
ne_utf8_encode(str)
	const char * str


void
neon_debug_init(stream,mask)
	FILE * stream
	int mask


void
neon_i18n_init()


int
neon_version_minimum(major,minor)
	int major
	int minor


const char *
neon_version_string()


void
sbuffer_altered(buf)
	sbuffer buf


int
sbuffer_append(buf,data,len)
	sbuffer buf
	const char * data
	size_t len


void
sbuffer_clear(buf)
	sbuffer buf


sbuffer
sbuffer_create()


sbuffer
sbuffer_create_sized(size)
	size_t size


char *
sbuffer_data(buf)
	sbuffer buf


void
sbuffer_destroy(buf)
	sbuffer buf


char *
sbuffer_finish(buf)
	sbuffer buf


int
sbuffer_grow(buf,size)
	sbuffer buf
	size_t size


int
sbuffer_size(buf)
	sbuffer buf


int
sbuffer_zappend(buf,str)
	sbuffer buf
	const char * str


nsocket *
sock_accept(listener)
	int listener


nssl_context *
sock_create_ssl_context()


void
sock_exit()


int
sock_init()


int
sock_name_lookup(hostname,addr)
	const char * hostname
	struct in_addr * addr


int
sock_service_lookup(name)
	const char * name


int
sock_transfer(fd,sock,readlen)
	int fd
	nsocket * sock
	off_t readlen


char *
uri_absolute(uri,scheme,hostport)
	const char * uri
	const char * scheme
	const char * hostport


const char *
uri_abspath(uri)
	const char * uri


char *
uri_abspath_escape(abs_path)
	const char * abs_path


int
uri_childof(parent,child)
	const char * parent
	const char * child


int
uri_compare(a,b)
	const char * a
	const char * b


void
uri_free(parsed)
	struct uri * parsed


int
uri_has_trailing_slash(uri)
	const char * uri


char *
uri_parent(path)
	const char * path


int
uri_parse(uri,parsed,defaults)
	const char * uri
	struct uri * parsed
	const struct uri * defaults


char *
uri_unescape(uri)
	const char * uri


BOOT:
   pC2Perl = newHV () ;
   pPerl2C = newHV () ;
