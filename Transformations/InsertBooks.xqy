xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace out="http://TargetNamespace.com/BookService_InsertBooks_request";
(:: import schema at "../Resources/xsd/insertBooks.xsd" ::)
declare namespace in="http://xmlns.oracle.com/pcbpel/adapter/db/top/Get_MyProject_BOOKS";
(:: import schema at "../Resources/xsd/Get_MyProject_BOOKS_table.xsd" ::)

declare variable $bookRecord as element() (:: element(*, in:MyprojectBooks) ::) external;

declare function local:insertBook($bookRecord as element() (:: element(*, in:MyprojectBooks) ::)) as element() (:: schema-element(out:Book) ::) {
    <out:Book>
        <out:title>{fn:data($bookRecord/in:title)}</out:title>
        <out:author>{fn:data($bookRecord/in:author)}</out:author>
        <out:isbn>{fn:data($bookRecord/in:isbn)}</out:isbn>
        <out:published>{fn:data($bookRecord/in:published)}</out:published>
        <out:genre>{fn:data($bookRecord/in:genere)}</out:genre>
    </out:Book>
};

local:insertBook($bookRecord)
