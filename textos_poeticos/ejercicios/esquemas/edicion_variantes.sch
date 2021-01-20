<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2" xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

    <!-- elements allowed in the teiHeader -->

    <pattern id="teiHeader">

        <rule context="tei:teiHeader">

            <assert test="tei:fileDesc">A &lt;teiHeader&gt; element must contain a &lt;fileDesc&gt; element.</assert>

            <assert test="tei:profileDesc">A &lt;teiHeader&gt; element must contain a &lt;profileDesc&gt; element.</assert>
            

        </rule>

        <!-- elements allowed in the fileDesc -->

        <rule context="tei:fileDesc">

            <assert test="tei:titleStmt">A &lt;fileDesc&gt; element must contain a &lt;titleStmt&gt; element.</assert>

            <assert test="tei:editionStmt">A &lt;fileDesc&gt; element must contain an &lt;editionStmt&gt; element.</assert>

            <assert test="tei:publicationStmt">A &lt;fileDesc&gt; element must contain a &lt;publicationStmt&gt; element.</assert>

            <assert test="tei:sourceDesc">A &lt;fileDesc&gt; element must contain a &lt;sourceDesc&gt; element.</assert>

        </rule>

        <rule context="tei:titleStmt">

            <assert test="tei:title">A &lt;titleStmt&gt; element must contain a &lt;title&gt; element.</assert>

            <assert test="tei:respStmt">A &lt;fileDesc&gt; element must contain a &lt;respStmt&gt; element.</assert>


        </rule>

        <rule context="tei:editionStmt">

            <assert test="tei:edition">A &lt;editionStmt&gt; element must contain an &lt;edition&gt; element.</assert>

        </rule>


        <rule context="tei:publicationStmt">

            <assert test="tei:distributor">A &lt;publicationStmt&gt; element must contain a &lt;distributor&gt; element.</assert>

            <assert test="tei:pubPlace">A &lt;publicationStmt&gt; element must contain a &lt;pubPlace&gt; element.</assert>

            <assert test="tei:availability">A &lt;publicationStmt&gt; element must contain a &lt;availability&gt; element.</assert>

        </rule>

        <rule context="tei:availability">

            <assert test="tei:licence">A &lt;availability&gt; element must contain a &lt;licence&gt; element.</assert>

        </rule>

        <rule context="tei:sourceDesc">

            <assert test="tei:bibl">A &lt;sourceDesc&gt; element must contain a &lt;bibl&gt; element.</assert>

            <assert test="tei:listWit">A &lt;sourceDesc&gt; element must contain a &lt;listBibl&gt; element.</assert>

        </rule>

        <rule context="tei:listWit">

            <assert test="tei:witness">A &lt;listWit&gt; element must contain a &lt;witness&gt; element.</assert>

        </rule>

        <rule context="tei:witness">

            <assert test="tei:msDesc or tei:biblStruct">A &lt;listWitc&gt; element must contain a &lt;msDesc&gt; or a &lt;biblStruct&gt; element.</assert>

        </rule>


        <rule context="tei:msDesc">

            <assert test="tei:msIdentifier">A &lt;msDesc&gt; element must contain a &lt;msIdentifier&gt; element.</assert>

        </rule>

        <rule context="tei:msDesc[@type = 'manuscript']/tei:msIdentifier">

            <assert test="tei:country">A &lt;msIdentifier&gt; element must contain a &lt;country&gt; element.</assert>

            <assert test="tei:settlement">A &lt;msIdentifier&gt; element must contain a &lt;settlement&gt; element.</assert>

            <assert test="tei:repository">A &lt;msIdentifier&gt; element must contain a &lt;repository&gt; element.</assert>

            <assert test="tei:idno">A &lt;msIdentifier&gt; element must contain an &lt;idno&gt; element.</assert>

            <assert test="tei:msName">A &lt;msIdentifier&gt; element must contain a &lt;msName&gt; element.</assert>

        </rule>


        <rule context="tei:witness">

            <assert test="matches(@xml:id, '\w')">A &lt;witness&gt; element must contain a &lt;@xml:id&gt; attribute.</assert>

        </rule>

        <rule context="tei:msDesc">

            <assert test="@type">A &lt;msDesc&gt; element must contain a &lt;@type&gt; attribute.</assert>

        </rule>

        <rule context="tei:msDesc[@type = 'print']/tei:msIdentifier">

            <assert test="tei:country">A &lt;msIdentifier&gt; element must contain a &lt;country&gt; element.</assert>

            <assert test="tei:settlement">A &lt;msIdentifier&gt; element must contain a &lt;settlement&gt; element.</assert>

            <assert test="tei:repository">A &lt;msIdentifier&gt; element must contain a &lt;repository&gt; element.</assert>

            <assert test="tei:idno">A &lt;msIdentifier&gt; element must contain an &lt;idno&gt; element.</assert>

        </rule>

        <rule context="tei:witness/tei:biblStruct/tei:monogr">

            <assert test="tei:author or tei:editor or tei:respStmt">A &lt;monogr&gt; element must contain an &lt;author&gt;, &lt;editor&gt; or a &lt;respStmt&gt; element.</assert>

            <assert test="tei:title">A &lt;monogr&gt; element must contain a &lt;title&gt; element.</assert>

            <assert test="tei:imprint">A &lt;monogr&gt; element must contain an &lt;imprint&gt; element.</assert>

        </rule>

    </pattern>


    <!-- rules for elements within front  -->

    <pattern id="front">

        <rule context="tei:text/tei:front/tei:p/tei:hi">
            <assert test="@rend = 'italic'">A &lt;hi&gt; element must contain a '@rend' whose value is 'italic'.</assert>
        </rule>

        <rule context="tei:text/tei:front/tei:p/tei:mentioned">
            <assert test="@rend = 'italic' or not(@rend)">A &lt;mentioned&gt; element must contain a '@rend' whose value is 'italic'.</assert>
        </rule>

        <rule context="tei:text/tei:front/tei:p/tei:persName">
            <assert test="@key">A &lt;persName&gt; element must contain a '@key' attribute.</assert>
            <assert test="matches(@role, 'poeta') or matches(@role, 'autoridad')">A &lt;persName&gt; element must contain a '@role' attribute whose value is 'poeta' or 'autoridad'.</assert>
        </rule>


    </pattern>


    <!-- rules for stanzas -->

    <pattern id="poem">

        <rule context="tei:body">

            <assert test="tei:lg">A &lt;body&gt; element must contain a &lt;lg&gt; element.</assert>

            <assert test="tei:lg/tei:l">A &lt;lg&gt; element must contain a &lt;l&gt; element.</assert>

        </rule>


    </pattern>


    <!-- rules for the apparatus -->

    <pattern id="apparatus">

        <rule context="tei:app">

            <assert test="tei:lem">A &lt;app&gt; element must contain a &lt;lem&gt; element.</assert>

            <assert test="tei:rdg">A &lt;app&gt; element must contain a &lt;rdg&gt; element.</assert>

        </rule>

        <rule context="tei:rdg">

            <assert test="matches(@type, 'substitución') or matches(@type, 'adición') or matches(@type, 'omisión') or matches(@type, 'transposición')">A &lt;rdg&gt; element must have a @type attribute
                whose values are 'substitución', 'adición', 'omisión' o 'transposición'.</assert>

            <assert
                test="
                    matches(@wit, '#A') or matches(@wit, '#B') or matches(@wit, '#Ch') or matches(@wit, '#E') or matches(@wit, '#F') or
                    matches(@wit, '#I') or matches(@wit, '#J') or matches(@wit, '#K') or matches(@wit, '#M') or matches(@wit, '#N') or matches(@wit, '#Vi') or matches(@wit, '#T') or matches(@wit,
                    '#Ho') or matches(@wit, '#Sa') or matches(@wit, '#Flo')"
                >A &lt;rdg&gt; must contain an attribute '@wit', whose value must match witness 'sigla'.</assert>

        </rule>


        <rule context="tei:del">
            <assert
                test="
                    matches(@rend, 'wrapped') or matches(@rend, 'strikethrough') or matches(@rend, 'overwritten') or matches(@rend, 'unmarked') or matches(@rend, 'underlined') or matches(@rend,
                    'annotation')"
                >A &lt;del&gt; element must have a @rend attribute with value: 'wrapped', 'strikethrough', 'overwritten', 'unmarked', 'underlined' or 'annotation'.</assert>
        </rule>


        <rule context="tei:add">
            <assert test="matches(@place, 'above') or matches(@place, 'inline') or matches(@place, 'margin') or matches(@place, 'below') or matches(@place, 'desconocido')">An &lt;add&gt; element must
                have a @place attribute with value: 'above', 'inline', 'margin' or 'below'.</assert>
        </rule>


    </pattern>

</schema>
