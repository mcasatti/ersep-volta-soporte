DECLARE
vcuils   sys.odcivarchar2list := sys.odcivarchar2list(
'20101715540',
'20115302257',
'20125123830',
'20169744948',
'20173199849',
'20178441249',
'20183489950',
'20184378966',
'20202317813',
'20206053497',
'20209966892',
'20215221033',
'20219951087',
'20225239151',
'20231949780',
'20232566583',
'20233794318',
'20237359829',
'20246865737',
'20248320053',
'20254135306',
'20258919743',
'20270129383',
'20277031192',
'20285385009',
'20286444270',
'20287855371',
'20288498378',
'20292014334',
'20293630772',
'20294562363',
'20295551950',
'20297475550',
'20303271024',
'20305733998',
'20307310563',
'20308432514',
'20314057423',
'20316087915',
'20318917095',
'20323734152',
'20328749220',
'20331171116',
'20332235398',
'20333037301',
'20334113141',
'20336547467',
'20338310537',
'20340398344',
'20341310394',
'20342106464',
'20344295728',
'20344698814',
'20345038877',
'20345955764',
'20347882381',
'20348393724',
'20348393910',
'20352017249',
'20356688520',
'20364317175',
'20364321377',
'20366043366',
'20366043722',
'20369335759',
'20369858654',
'20372959267',
'20378229600',
'20378739668',
'20380016517',
'20382793790',
'20383385734',
'20394757749',
'20394955966',
'20394994198',
'20404173163',
'20405210070',
'20406823793',
'20408949077',
'20412660898',
'20413223467',
'20414827382',
'20424001644',
'20424406016',
'20424420752',
'20438112775',
'20441946814',
'20441949171',
'20443467824',
'20444742845',
'20444744295',
'20447690005',
'20951318362',
'23130905609',
'23184819279',
'23335989619',
'24261797484',
'27213917515',
'27288590899',
'27307556451',
'27378169165' 
);
vnums   sys.odcivarchar2list := sys.odcivarchar2list(
'10171554-11824',
'11530225-11825',
'12512383-11826',
'16974494-11827',
'17319984-11828',
'17844124-11829',
'18348995-11830',
'18437896-11831',
'20231781-11832',
'20605349-11833',
'20996689-11834',
'21522103-11835',
'21995108-11836',
'22523915-11837',
'23194978-11838',
'23256658-11839',
'23379431-11840',
'23735982-11841',
'24686573-11842',
'24832005-11843',
'25413530-11844',
'25891974-11845',
'27012938-11846',
'27703119-11847',
'28538500-11848',
'28644427-11849',
'28785537-11850',
'28849837-11851',
'29201433-11852',
'29363077-11853',
'29456236-11854',
'29555195-11855',
'29747555-11856',
'30327102-11857',
'30573399-11858',
'30731056-11859',
'30843251-11860',
'31405742-11861',
'31608791-11862',
'31891709-11863',
'32373415-11864',
'32874922-11865',
'33117111-11866',
'33223539-11867',
'33303730-11868',
'33411314-11869',
'33654746-11870',
'33831053-11871',
'34039834-11872',
'34131039-11873',
'34210646-11874',
'34429572-11875',
'34469881-11876',
'34503887-11877',
'34595576-11878',
'34788238-11879',
'34839372-11880',
'34839391-11881',
'35201724-11882',
'35668852-11883',
'36431717-11884',
'36432137-11885',
'36604336-11886',
'36604372-11887',
'36933575-11888',
'36985865-11889',
'37295926-11890',
'37822960-11891',
'37873966-11892',
'38001651-11893',
'38279379-11894',
'38338573-11895',
'39475774-11896',
'39495596-11897',
'39499419-11898',
'40417316-11899',
'40521007-11900',
'40682379-11901',
'40894907-11902',
'41266089-11903',
'41322346-11904',
'41482738-11905',
'42400164-11906',
'42440601-11907',
'42442075-11908',
'43811277-11909',
'44194681-11910',
'44194917-11911',
'44346782-11912',
'44474284-11913',
'44474429-11914',
'44769000-11915',
'95131836-11916',
'13090560-11917',
'18481927-11918',
'33598961-11919',
'26179748-11920',
'21391751-11921',
'28859089-11922',
'30755645-11923',
'37816916-11924'
);
vinforme number := '0085'; 
vid_informe number := 20;
BEGIN
    -- select id_informe_tecnico into vid_informe from ersep_segelec.t_informes_tecnicos where nro_informe_tecnico = vinforme;
    FOR i IN 1..vcuils.last LOOP
        /*
        Hacer un update del numero de habilitacion por el indicado
        */
        BEGIN
            UPDATE ersep_segelec.t_det_informes_tecnicos set
                nro_registro = vnums(i)
            WHERE
                id_postulante = vcuils(i) and id_informe_tecnico = vid_informe;
            
            DBMS_OUTPUT.PUT_LINE ('UPDATED '||vcuils(i)||' -> '||vnums(i));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ERROR AL ACTUALIZAR '||vcuils(i)||' -> '||vnums(i)||' : '||SQLERRM);
        END;
    END LOOP;
END;
