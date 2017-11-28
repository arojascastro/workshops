<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2" xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>

    <!-- elements allowed in the teiHeader -->

    <pattern id="teiHeader">

        <rule context="tei:teiHeader">

            <assert test="tei:fileDesc">A &lt;teiHeader&gt; element must contain a &lt;fileDesc&gt; element.</assert>

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

    <!-- elements allowed in notes -->

    <pattern id="notes">

        <rule context="tei:text/tei:body/tei:lg/tei:l/tei:note/tei:hi">
            <assert test="matches(@rend, 'italic')">A &lt;hi&gt; element must contain a '@rend' whose value is 'italic'.</assert>
        </rule>

        <rule context="tei:text/tei:body/tei:lg/tei:l/tei:note/tei:mentioned">
            <assert test="not(@rend)">A &lt;mentioned&gt; element cannot contain a '@rend' attribute.</assert>
        </rule>

        <rule context="tei:text/tei:body/tei:lg/tei:l/tei:note/tei:term">
            <assert test="@ana">A &lt;term&gt; element must contain a '@ana' attribute.</assert>
        </rule>



    </pattern>


    <!-- elements allowed in the poem -->

    <pattern id="poem">

        <rule context="tei:text/tei:body/tei:lg/tei:l">
            <assert test="matches(@xml:id, 'v-\d{5}')">A &lt;l&gt; element must contain a '@xml:id' atribute whose value is 'v-\d{4}'.</assert>
        </rule>

        <rule context="tei:text/tei:body/tei:lg/tei:l/choice">
            <assert test="tei:orig">A &lt;choice&gt; element must contain a &lt;orig&gt; element.</assert>
            <assert test="tei:reg">A &lt;choice&gt; element must contain a &lt;reg&gt; element.</assert>
        </rule>

    </pattern>

</schema>
