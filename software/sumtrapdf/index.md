# 关联pdf

sumatrapdf.exe -register-for-pdf
https://www.sumatrapdfreader.org/docs/Command-line-arguments


# 关联其他文件

Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Classes\.epub]

@="epub_auto_file"

[HKEY_CURRENT_USER\Software\Classes\.mobi]

@="mobi_auto_file"

[HKEY_CLASSES_ROOT\mobi_auto_file]

@=""

[HKEY_CLASSES_ROOT\mobi_auto_file\DefaultIcon]

@="D:\\Program Files\\SumatraPDF\\SumatraPDF x64.exe,1"

[HKEY_CLASSES_ROOT\mobi_auto_file\shell]

[HKEY_CLASSES_ROOT\mobi_auto_file\shell\open]

[HKEY_CLASSES_ROOT\mobi_auto_file\shell\open\command]

@="\"D:\\Program Files\\SumatraPDF\\SumatraPDF x64.exe\" \"%1\""

[HKEY_CLASSES_ROOT\epub_auto_file]

@=""

[HKEY_CLASSES_ROOT\epub_auto_file\DefaultIcon]

@="D:\\Program Files\\SumatraPDF\\SumatraPDF x64.exe,1"

[HKEY_CLASSES_ROOT\epub_auto_file\shell]

[HKEY_CLASSES_ROOT\epub_auto_file\shell\open]

[HKEY_CLASSES_ROOT\epub_auto_file\shell\open\command]

@="\"D:\\Program Files\\SumatraPDF\\SumatraPDF x64.exe\" \"%1\""