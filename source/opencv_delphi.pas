unit opencv_delphi;

{$I opencv_delphi.inc}

interface

Uses
  OpenCV.Import;

Type
  pCppString = ^CppString;

  CppString = record
  private
{$HINTS OFF}
    Dummy: array [0 .. 39] of byte;
{$HINTS ON}
  public
    class operator Initialize(out Dest: CppString);
    class operator Finalize(var Dest: CppString);

    function length: UInt64; {$IFDEF USE_INLINE}inline; {$ENDIF}
    function size: UInt64; {$IFDEF USE_INLINE}inline; {$ENDIF}
    procedure erase(const _Off: UInt64 = 0); {$IFDEF USE_INLINE}inline; {$ENDIF}
    procedure assign(const p: pAnsiChar); {$IFDEF USE_INLINE}inline; {$ENDIF}
    class operator assign(var Dest: CppString; const [ref] Src: CppString);
    class operator Implicit(const p: pAnsiChar): CppString;
    class operator Implicit(const s: String): CppString;
  end;

  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@$$QEAV01@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &&)
  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@$$QEAV01@AEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &&,class std::allocator<char> const &)
  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@AEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,class std::allocator<char> const &)
  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@_K1AEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,unsigned __int64,class std::allocator<char> const &)
  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV01@_KAEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,class std::allocator<char> const &)
  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@AEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::allocator<char> const &)

  // ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z
  // std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(char const * const)
procedure Constructor_String(Obj: pCppString; pac: pAnsiChar); overload; external opencv_delphi_dll name '??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD@Z'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBDAEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(char const * const,class std::allocator<char> const &)
// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD_K@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(char const * const,unsigned __int64)
// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@QEBD_KAEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(char const * const,unsigned __int64,class std::allocator<char> const &)
// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@V?$initializer_list@D@1@AEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(class std::initializer_list<char>,class std::allocator<char> const &)

// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ
// std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(void)
procedure Constructor_String(Obj: pCppString); overload; external opencv_delphi_dll name '??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@_KD@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(unsigned __int64,char)
// ??0?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@_KDAEBV?$allocator@D@1@@Z	std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(unsigned __int64,char,class std::allocator<char> const &)

// ??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ
// std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::~basic_string<char,struct std::char_traits<char>,class std::allocator<char> >(void)
procedure Destructor_String(Obj: pCppString); overload; external opencv_delphi_dll name '??1?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA@XZ'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@$$QEAV01@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator=(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &&)
// ??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator=(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator=(char)
// ??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator=(char const * const)
// ??4?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator=(class std::initializer_list<char>)
// ??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z	char & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator[](unsigned __int64)
// ??A?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z	char const & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator[](unsigned __int64)
// ??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@AEBV01@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator+=(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@D@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator+=(char)
// ??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@QEBD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator+=(char const * const)
// ??Y?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV01@V?$initializer_list@D@1@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::operator+=(class std::initializer_list<char>)
// ?_Become_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Become_small(void)
// ?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBA_K_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Calculate_growth(unsigned __int64)
// ?_Calculate_growth@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CA_K_K00@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Calculate_growth(unsigned __int64,unsigned __int64,unsigned __int64)
// ?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEAD0Urandom_access_iterator_tag@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Construct(char * const,char * const,struct std::random_access_iterator_tag)
// ?_Construct@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXQEBD0Urandom_access_iterator_tag@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Construct(char const * const,char const * const,struct std::random_access_iterator_tag)
// ?_Construct_lv_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Construct_lv_contents(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$00@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Copy_assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,struct std::integral_constant<bool,1>)
// ?_Copy_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@U?$integral_constant@_N$0A@@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Copy_assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,struct std::integral_constant<bool,0>)
// ?_Copy_assign_val_from_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Copy_assign_val_from_small(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?_Copy_s@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Copy_s(char * const,unsigned __int64,unsigned __int64,unsigned __int64)
// ?_Eos@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAX_K@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Eos(unsigned __int64)
// ?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NAEBV12@@Z	bool std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Equal(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?_Equal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NQEBD@Z	bool std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Equal(char const * const)
// ?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAAEAV?$allocator@D@2@XZ	class std::allocator<char> & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Getal(void)
// ?_Getal@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEBAAEBV?$allocator@D@2@XZ	class std::allocator<char> const & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Getal(void)
// ?_Memcpy_val_from@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEBV12@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Memcpy_val_from(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$00@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Move_assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::integral_constant<bool,1>)
// ?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Move_assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::integral_constant<bool,0>)
// ?_Move_assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U_Equal_allocators@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Move_assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::_Equal_allocators)
// ?_Orphan_all@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Orphan_all(void)
// ?_Swap_bx_large_with_small@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV?$_String_val@U?$_Simple_types@D@std@@@2@0@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Swap_bx_large_with_small(class std::_String_val<struct std::_Simple_types<char> > &,class std::_String_val<struct std::_Simple_types<char> > &)
// ?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@U?$integral_constant@_N$00@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Swap_data(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::integral_constant<bool,1>)
// ?_Swap_data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Swap_data(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::integral_constant<bool,0>)
// ?_Swap_proxy_and_iterators@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Swap_proxy_and_iterators(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &)
// ?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$00@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Take_contents(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::integral_constant<bool,1>)
// ?_Take_contents@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXAEAV12@U?$integral_constant@_N$0A@@2@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Take_contents(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &,struct std::integral_constant<bool,0>)
// ?_Tidy_deallocate@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Tidy_deallocate(void)
// ?_Tidy_init@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@AEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Tidy_init(void)
// ?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ	char * std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Unchecked_begin(void)
// ?_Unchecked_begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ	char const * std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Unchecked_begin(void)
// ?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAPEADXZ	char * std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Unchecked_end(void)
// ?_Unchecked_end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ	char const * std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Unchecked_end(void)
// ?_Xlen@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@CAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::_Xlen(void)
// ?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::append(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::append(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,unsigned __int64)
// ?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::append(char const * const)
// ?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::append(char const * const,unsigned __int64)
// ?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::append(class std::initializer_list<char>)
// ?append@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::append(unsigned __int64,char)
// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@$$QEAV12@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &&)

// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z
// class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
procedure assign_String(Obj: pCppString; a: pCppString); overload; external opencv_delphi_dll name '?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@@Z'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@AEBV12@_K_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,unsigned __int64)

// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z
// class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(char const * const)
procedure assign_String(Obj: pCppString; pac: pAnsiChar); overload; external opencv_delphi_dll name '?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD@Z'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@QEBD_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(char const * const,unsigned __int64)
// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$initializer_list@D@2@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(class std::initializer_list<char>)
// ?assign@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::assign(unsigned __int64,char)
// ?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAD_K@Z	char & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::at(unsigned __int64)
// ?at@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBD_K@Z	char const & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::at(unsigned __int64)
// ?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ	char & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::back(void)
// ?back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ	char const & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::back(void)
// ?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::begin(void)
// ?begin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ	class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::begin(void)
// ?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ	char const * std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::c_str(void)
// ?capacity@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::capacity(void)
// ?cbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ	class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::cbegin(void)
// ?cend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ	class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::cend(void)
// ?clear@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::clear(void)
// ?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHAEBV12@@Z	int std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::compare(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAHQEBD@Z	int std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::compare(char const * const)
// ?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@00@Z	int std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::compare(unsigned __int64,unsigned __int64,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,unsigned __int64)
// ?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0AEBV12@@Z	int std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::compare(unsigned __int64,unsigned __int64,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD0@Z	int std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::compare(unsigned __int64,unsigned __int64,char const * const,unsigned __int64)
// ?compare@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAH_K0QEBD@Z	int std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::compare(unsigned __int64,unsigned __int64,char const * const)
// ?copy@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEAD_K_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::copy(char * const,unsigned __int64,unsigned __int64)
// ?crbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ	class std::reverse_iterator<class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::crbegin(void)
// ?crend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ	class std::reverse_iterator<class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::crend(void)
// ?data@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAPEBDXZ	char const * std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::data(void)
// ?empty@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_NXZ	bool std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::empty(void)
// ?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::end(void)
// ?end@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@XZ	class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::end(void)
// ?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0@Z	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::erase(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >)
// ?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@@Z	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::erase(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >)

// ?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K@Z
// class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::erase(unsigned __int64)
procedure erase_String(Obj: pCppString; _Off: UInt64 = 0); overload; external opencv_delphi_dll name '?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K@Z'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ?erase@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::erase(unsigned __int64,unsigned __int64)
// ?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64)
// ?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find(char,unsigned __int64)
// ?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find(char const * const,unsigned __int64,unsigned __int64)
// ?find@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find(char const * const,unsigned __int64)
// ?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_not_of(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64)
// ?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_not_of(char,unsigned __int64)
// ?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_not_of(char const * const,unsigned __int64,unsigned __int64)
// ?find_first_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_not_of(char const * const,unsigned __int64)
// ?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_of(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64)
// ?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_of(char,unsigned __int64)
// ?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_of(char const * const,unsigned __int64,unsigned __int64)
// ?find_first_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_first_of(char const * const,unsigned __int64)
// ?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_not_of(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64)
// ?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_not_of(char,unsigned __int64)
// ?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_not_of(char const * const,unsigned __int64,unsigned __int64)
// ?find_last_not_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_not_of(char const * const,unsigned __int64)
// ?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_of(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64)
// ?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_of(char,unsigned __int64)
// ?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_of(char const * const,unsigned __int64,unsigned __int64)
// ?find_last_of@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::find_last_of(char const * const,unsigned __int64)
// ?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEADXZ	char & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::front(void)
// ?front@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBAAEBDXZ	char const & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::front(void)
// ?get_allocator@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$allocator@D@2@XZ	class std::allocator<char> std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::get_allocator(void)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@D@Z	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,char)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$initializer_list@D@2@@Z	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::initializer_list<char>)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@_KD@Z	class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,unsigned __int64,char)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0D@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(unsigned __int64,unsigned __int64,char)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@0_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(unsigned __int64,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,unsigned __int64)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KAEBV12@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(unsigned __int64,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD0@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(unsigned __int64,char const * const,unsigned __int64)
// ?insert@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_KQEBD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::insert(unsigned __int64,char const * const)

// ?length@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ
// unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::length(void)
function length_String(Obj: pCppString): UInt64; overload; external opencv_delphi_dll name '?length@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};

// ?max_size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::max_size(void)
// ?pop_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::pop_back(void)
// ?push_back@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXD@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::push_back(char)
// ?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ	class std::reverse_iterator<class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rbegin(void)
// ?rbegin@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ	class std::reverse_iterator<class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rbegin(void)
// ?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAA?AV?$reverse_iterator@V?$_String_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ	class std::reverse_iterator<class std::_String_iterator<class std::_String_val<struct std::_Simple_types<char> > > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rend(void)
// ?rend@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV?$reverse_iterator@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@std@@@2@XZ	class std::reverse_iterator<class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > > > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rend(void)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0AEBV12@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,char const * const)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0QEBD_K@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,char const * const,unsigned __int64)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0V?$initializer_list@D@2@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::initializer_list<char>)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@V?$_String_const_iterator@V?$_String_val@U?$_Simple_types@D@std@@@std@@@2@0_KD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,class std::_String_const_iterator<class std::_String_val<struct std::_Simple_types<char> > >,unsigned __int64,char)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0AEBV12@@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(unsigned __int64,unsigned __int64,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K0QEBD@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(unsigned __int64,unsigned __int64,char const * const)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_K0D@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(unsigned __int64,unsigned __int64,unsigned __int64,char)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KAEBV12@01@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(unsigned __int64,unsigned __int64,class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64,unsigned __int64)
// ?replace@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAAEAV12@_K_KQEBD0@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > & std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::replace(unsigned __int64,unsigned __int64,char const * const,unsigned __int64)
// ?reserve@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_K@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::reserve(unsigned __int64)
// ?resize@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAX_KD@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::resize(unsigned __int64,char)
// ?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KAEBV12@_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rfind(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > const &,unsigned __int64)
// ?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rfind(char,unsigned __int64)
// ?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K1@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rfind(char const * const,unsigned __int64,unsigned __int64)
// ?rfind@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KQEBD_K@Z	unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::rfind(char const * const,unsigned __int64)
// ?shrink_to_fit@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXXZ	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::shrink_to_fit(void)

// ?size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ
// unsigned __int64 std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::size(void)
function size_String(Obj: pCppString): UInt64; overload; external opencv_delphi_dll name '?size@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA_KXZ'
{$IFDEF DELAYED_LOAD_DLL}delayed{$ENDIF};
// ?substr@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEBA?AV12@_K0@Z	class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::substr(unsigned __int64,unsigned __int64)
// ?swap@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QEAAXAEAV12@@Z	void std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> >::swap(class std::basic_string<char,struct std::char_traits<char>,class std::allocator<char> > &)

implementation

{ CppString }

procedure CppString.assign(const p: pAnsiChar);
begin
  assign_String(@Self, p);
end;

class operator CppString.assign(var Dest: CppString; const [ref] Src: CppString);
begin
  Finalize(Dest);
  assign_String(pCppString(@Src), pCppString(@Dest));
end;

procedure CppString.erase(const _Off: UInt64);
begin
  erase_String(@Self, _Off);
end;

class operator CppString.Finalize(var Dest: CppString);
begin
  Destructor_String(@Dest);
end;

class operator CppString.Implicit(const s: String): CppString;
begin
  Result.assign(pAnsiChar(AnsiString(s)));
end;

class operator CppString.Implicit(const p: pAnsiChar): CppString;
begin
  Result.assign(p);
end;

class operator CppString.Initialize(out Dest: CppString);
begin
  Constructor_String(@Dest);
end;

function CppString.length: UInt64;
begin
  Result := length_String(@Self);
end;

function CppString.size: UInt64;
begin
  Result := size_String(@Self);
end;

end.
