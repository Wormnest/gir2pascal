{
ctypesmapping.pas
Copyright (C) 2011  Andrew Haines andrewd207@aol.com

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
}
unit girCTypesMapping;

{$mode objfpc}{$H+}

interface

type
  TConversionInfo = record
    CTypeName:      String;
    PascalTypeName: String;
  end;

const
  GenericCTypesCount = 13;
  GLibCTypesCount    = 28;

var
  TGenericConversionData: array [0..GenericCTypesCount-1] of TConversionInfo = (
    (CTypeName: 'char';                PascalTypeName: 'char'),
    (CTypeName: 'char*';               PascalTypeName: 'pchar'),
    (CTypeName: 'char**';              PascalTypeName: 'ppchar'),
    (CTypeName: 'double';              PascalTypeName: 'cdouble'),
    (CTypeName: 'file';                PascalTypeName: 'file'),
    (CTypeName: 'int';                 PascalTypeName: 'cint'),
    (CTypeName: 'long';                PascalTypeName: 'clong'),
    (CTypeName: 'long double';         PascalTypeName: 'extended'),
    (CTypeName: 'size_t';              PascalTypeName: 'csize_t'),
    (CTypeName: 'ulong';               PascalTypeName: 'culong'),
    (CTypeName: 'unsigned long long';  PascalTypeName: 'qword'),
    (CTypeName: 'void';                PascalTypeName: 'void'),
    (CTypeName: 'void*';               PascalTypeName: 'pointer')
  );

  TGLibConversionData: array [0..GLibCTypesCount-1] of TConversionInfo = (
    (CTypeName: 'gboolean';            PascalTypeName: 'Boolean32'),
    (CTypeName: 'gchar';               PascalTypeName: 'char'),
    (CTypeName: 'gchar*';              PascalTypeName: 'pchar'),
    (CTypeName: 'gchar**';             PascalTypeName: 'ppchar'),
    (CTypeName: 'gconstpointer';       PascalTypeName: 'pointer'),
    (CTypeName: 'gdouble';             PascalTypeName: 'cdouble'),
    (CTypeName: 'gfloat';              PascalTypeName: 'cfloat'),
    (CTypeName: 'gint';                PascalTypeName: 'cint'),
    (CTypeName: 'gint8';               PascalTypeName: 'cint8'),
    (CTypeName: 'gint16';              PascalTypeName: 'cint16'),
    (CTypeName: 'gint32';              PascalTypeName: 'cint32'),
    (CTypeName: 'gint64';              PascalTypeName: 'cint64'),
    (CTypeName: 'glong';               PascalTypeName: 'clong'),
    (CTypeName: 'goffset';             PascalTypeName: 'Int64'),
    (CTypeName: 'gpointer';            PascalTypeName: 'pointer'),
    (CTypeName: 'gshort';              PascalTypeName: 'cshort'),
    (CTypeName: 'gsize';               PascalTypeName: 'csize_t'),
    (CTypeName: 'gssize';              PascalTypeName: 'PtrInt'),
    (CTypeName: 'guchar';              PascalTypeName: 'byte'),
    (CTypeName: 'guint';               PascalTypeName: 'cuint'),
    (CTypeName: 'guint8';              PascalTypeName: 'cuint8'),
    (CTypeName: 'guint16';             PascalTypeName: 'cuint16'),
    (CTypeName: 'guint32';             PascalTypeName: 'cuint32'),
    (CTypeName: 'guint64';             PascalTypeName: 'cuint64'),
    (CTypeName: 'gulong';              PascalTypeName: 'culong'),
    (CTypeName: 'gunichar';            PascalTypeName: 'cuint32'),
    (CTypeName: 'gunichar2';           PascalTypeName: 'cuint32'),
    (CTypeName: 'gushort';             PascalTypeName: 'cushort')
  );

  function LookupGTypeToCType(AName: String): String;



implementation

function LookupGTypeToCType(AName: String): String;
var
  i: Integer;
begin
  for i := 0 to GenericCTypesCount-1 do
    if AName = TGenericConversionData[i].CTypeName then
      Exit(TGenericConversionData[i].PascalTypeName);

  for i := 0 to GLibCTypesCount-1 do
    if AName = TGLibConversionData[i].CTypeName then
      Exit(TGLibConversionData[i].PascalTypeName);

  Result := '';
end;

end.

