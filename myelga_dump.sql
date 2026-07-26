-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elga_app_schema
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `breeder_submission`
--

DROP TABLE IF EXISTS `breeder_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breeder_submission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `compensation_factor` float(5,2) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `damage_coverage_percentage` float(5,2) DEFAULT NULL,
  `number_of_killed_animals` int DEFAULT NULL,
  `price_per_unit` double(7,2) DEFAULT NULL,
  `residual_value` double(7,2) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `total_animals` int DEFAULT NULL,
  `compensation_id` bigint DEFAULT NULL,
  `farmer_id` bigint DEFAULT NULL,
  `file_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9l0wcjbpi67wy812ybi1qgebh` (`compensation_id`),
  UNIQUE KEY `UK_aepy0vtxvbmpuosxjq9q6ka7f` (`file_id`),
  KEY `FK75hupy0cayyiunxllopg7hr95` (`farmer_id`),
  CONSTRAINT `FK75hupy0cayyiunxllopg7hr95` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`),
  CONSTRAINT `FKcaca0akvql2v1yo2a1n7h25p7` FOREIGN KEY (`compensation_id`) REFERENCES `damages` (`id`),
  CONSTRAINT `FKgrn5956mf3ufa2xwddts1flkr` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeder_submission`
--

LOCK TABLES `breeder_submission` WRITE;
/*!40000 ALTER TABLE `breeder_submission` DISABLE KEYS */;
INSERT INTO `breeder_submission` VALUES (12,0.00,'2026-07-23',0.00,12345,12345.00,NULL,'REJECTED',12345,NULL,3,NULL),(13,0.00,'2026-07-23',0.00,4321,54321.00,NULL,'CREATED',4321,NULL,3,NULL);
/*!40000 ALTER TABLE `breeder_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `damages`
--

DROP TABLE IF EXISTS `damages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `damages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `damages_sum` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damages`
--

LOCK TABLES `damages` WRITE;
/*!40000 ALTER TABLE `damages` DISABLE KEYS */;
INSERT INTO `damages` VALUES (7,150000.00);
/*!40000 ALTER TABLE `damages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elga`
--

DROP TABLE IF EXISTS `elga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elga` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `afm` bigint DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `job_address` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_manager_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ao52rx66mn9c45vwp3grvdt7a` (`user_manager_id`),
  CONSTRAINT `FKb1pwdnjd80ivqa8gh5fn7f75p` FOREIGN KEY (`user_manager_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elga`
--

LOCK TABLES `elga` WRITE;
/*!40000 ALTER TABLE `elga` DISABLE KEYS */;
INSERT INTO `elga` VALUES (2,123456789,'MANAGERNAME','ATHENS','MANAGERLAST',7);
/*!40000 ALTER TABLE `elga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmer`
--

DROP TABLE IF EXISTS `farmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `afm` bigint DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `user_farmer_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jgdk6iy477lsu1wttqcfnwm0a` (`user_farmer_id`),
  CONSTRAINT `FKe86ud425omga6anl3d6rw7e4u` FOREIGN KEY (`user_farmer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmer`
--

LOCK TABLES `farmer` WRITE;
/*!40000 ALTER TABLE `farmer` DISABLE KEYS */;
INSERT INTO `farmer` VALUES (3,123456789,'OMIROU 9, TAVROS','CHRISTOS','APOSTOLIDIS',6987654321,6);
/*!40000 ALTER TABLE `farmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pdf_file` blob,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (7,_binary '%PDF-1.5\n%\â\ã\Ï\Ó\n142 0 obj\n<</Filter/FlateDecode/Length 10>>stream\nxœ+\ä\0\0\î\0|\nendstream\nendobj\n35 0 obj\n<</Filter/FlateDecode/Length 36>>stream\nxœ+\ä2T0\0B™œË¥\â\ã\ìZY™\ì\î¯\à’\Ï\È\0¦\nendstream\nendobj\n141 0 obj\n<</Filter/FlateDecode/Length 139>>stream\nxœu\Ğ1\Ã ĞSø”›½\ê3tª\Şi‘ I,¾ñ_\Ü×\Âv@I\à%“Tø ô^\İãµ‚·L,ûk)\É\'(Ş¡-©€÷«#6P\Î:’’R\å3\â\Ø\æp·E­c;±ORA\'T¯¨Í™\r\Âiú3\×Â¥¶šÂ´\ÆTZş\nendstream\nendobj\n137 0 obj\n<</Author(§ Á ® \Ã \Ä ¿ \Â  )/CreationDate(D:20240114114119Z)/Creator(Canva)/Keywords(DAF5te4OoIE,BAF2ZGlca9o)/ModDate(D:20260723220654+03\'00\')/Producer(DocFly; modified using iText® Core 8.0.2 \\(AGPL version\\) ©2000-2023 Apryse Group NV)/Title(şÿ\\000‘\\000 \\000™\\000 \\000¤\\000 \\000—\\000 \\000£\\000 \\000—\\000 )>>\nendobj\n136 0 obj\n<</Lang(el-GR)/MarkInfo<</Marked true>>/Metadata 143 0 R/Pages 135 0 R/StructTreeRoot 37 0 R/Type/Catalog/ViewerPreferences<</DisplayDocTitle true>>>>\nendobj\n28 0 obj\n<</BBox[0 7.82998 595.5 850.07996]/Filter/FlateDecode/Length 1628/Resources<</ExtGState<</G3 29 0 R>>/Font<</F4 30 0 R>>>>/StructParents 0/Subtype/Form/Type/XObject>>stream\nxœ\ÍYÛŠ\ãF}÷W\è9ºö†…Û’‡…$\ä’\ìB`\Ùü?¤dKj\ÙVÉ’­a²‹\ív—ª«\êœ:\Õ\Äeÿ¯ûû1Œ\Şf…\0©”\Øüşm÷Ï®]\'\ÉHV(“6\ßÿ\ÜıöCó·-s@[h¿T_\Ù>lÚ¿_?5‡ß¿\î\î>qóõß½¹T¤A$n\Í|\Ùıbÿ\×\Ç\ØW0J1C9pI%§ö¹£¤&P&i·¯Í‡ó«?¯»»Ÿ›ûû»Ï?=™ùww/\Ò(f\0 \æõ‹gŸlˆ Qi^¿\í\î_Ò‡\æõ¯\ç \æFj¿ôúG\Ó.<\íPB\ÆH1—~… \ÛBA“myœ¶Eû\æ”\Ó\rÏŸwÏ¯]‰\í‰1¢6‚’p¤†\0!h¦\Ü Ç\ÌN£\Èe\\\èp\Âún\Ê\Ô>Àó@E°	B–£}|O>;N7§h	\Ó8N÷´£]Ú‘SP‹<\ã\\Lû\ç\Şq¢q”hBKôq’A-û§\äCª	\äQ\r$%rÍö¹&;d¡TWø°-ü%A”Óœ¶—\\¢j]y8¬¤\0-\ìGe\à9\Ğ›†b\ÏUÈ³»%9+\Ğù|fl\Î\å\Î \Éòp1\0®\ÏV\àN4ñå£»\â \ÍA3H`\Ìq\"°\"\ÕTÒœ\r	\ìİ—\ãù‡k@2vu’Eø8rn!>hX$¤¼øò\â\æ\íqCL!=ö\ÈQˆ-#-€¡÷˜™’òª\Ğˆ‹)†3øğÀ6MÏ³\Ë{ c\ç\rJ¥‰QŸ¬¦$¡˜(±6l”I…8cuN9B>\0gx7a¨\ÅM\ŞC¤X\Ç\r…\ïasú\Ù1j0a:EM5\Ü\Ò(‚\Õ)Š†”b1ôõ–´\ÊÓ‘±\ë|e<\'®&IA0K[\×Ò¾Jº\Ò\ÓI[WFu\Â\ÕQ Ô´—)*\á³\ì\ã‘f[\Ój\ê-òŸ&“;·–iµô&uŠF\Ğ@ñöˆVS\Ûyzµ6™l€Q\Ğ\r¤9:’Iş:’9^zQ\Î=§q\Ö\"NÃ\í =€³\nì”’uº¢%\ïÜ­<ô+‚‚¥+HO\Ç9;¤°uc{aôs{$da$†^1qª\è®|ôb‡>-ö¹\Ö^\ÅÔ·${;l¡A$\Ë•²<3aµúµ1C[*g*A\"\Ña\ÕY\ÉcÀCXûv*º‡\è\Ğ\èkXs\ÄX¤\Êj\äÅ‚dƒ~d\Ä\rNÃ¦ôY°3•*l0wZ³\r\Ä<B@_Y\Âq”÷\Üg\×\ÈFMfU[©_,d°¨{\Ğ\İ\ã\Õ\n2\Â&’€\Êi/Šw.\æ\r$ \rÂ‡û\ãPDÂšjr˜™cÁz&*\ë\Ñ4U\Ø pT«jÎŠ\âp)ucğò\â\à\r\"X©\"½Z”.[\ÙD‰·Ø¤\ÕoQø\à\ì!GÚ˜9·#Q.Mkİ¢d¯úf\×)¹)S\Û5sd‘ ÁX.Z#\Åk2õ6\Úd\Í%¦-<l½Ÿ@R	11g9\æ—nÁôe1z†º6v¡1\Ã`\é\ÙB€A´\ÎÃŒ\Õ3Y<¡6ÿNµ4s\ÖXw‘œ\Ï\ÕG”\Ï\à\ë=†P\\%ñ\Ò\ï1U’˜\Î\îÜ™sz½\î¢@œğ™¨÷9	À¸\Õz\\\äT—\áı`º™qOy-/”\'yi\'œKó$\ÈY\âå•“ğ\'\Â\Å\Å<\×ù*tEcy\è\",–ô\ât¾¹šö¸~ŸVò¦\r·xµ³¥Æ¶ª#øó‰/[™Jğ\ì\âV\ä\Û\Z‡y\Ã[P5\â\â|;\Zdf\ZÛv}1:G\È\í^E\â3#¤Oü°º¿lH‰~õKtf\ê¾,\Æk‰¶·©)v·©7–(mp\Ë\à\×ñú\Ô\ÍT•;¹”0“\ÕKó\ÒT\0\Ö;€T­!—¢ w~¯GD\ê<Æ¥ş¹\Ùİ•şóO\èútJ°o*ª\çSÂ²k\ÔI[o3\Ğ·W<I¶h[\ï6\ĞHa›%L}6¦IÚ‹Î´\Å]\n.¿òõï®¶Wˆğ9œ­\ï_3\×g3u‡º®µ\ã©D\Ë)´¿w©U•}\İÒ›Ù°G¿H-úùd\ÊÔ•%\n	o,\ÑÁ-!\Ú6\ÜD·/½Š÷o¬\æ\nÄ­C¿\nÜ¢ö)ºc\Õ`DZ\ÄU×»~ó\ÙŞ«\Ûk„¬|šj1†HV®\çwvY\Öòñ„­w\ãc´k\în\Õá–„¬\ï3¦®Ÿ,gğ6#‰|·\éœ\ê\İñ¸£\Î-PUüb\ÃÁ\nendstream\nendobj\n33 0 obj\n<</Filter/FlateDecode/Length 14559/Length1 40064>>stream\nxœ\í}	|SUöÿ9oIò²4yI³5m“ôu\ZºAlZ‹-«-ˆ-ZE¥²¸; 2\Ê\"*::.0#£\Ëwf\Æeu\Ä··q˜Q\è\ËÿÜ›¤´Zf\æ\'¿~tş?\ï\ë;\ï.\ç\Ş{\î=\ß{\îò\Ò\0D$€Æ‰e\å\ç6<¼\07SlÛ”Qc›§\È‹\0\n–\0¨kN:}FG¼4ş€\à#8\é¬¡\Ó[\çüš2/ ¸¥³:N>½\Ú\â±R\ëŒ›N1¿< ¯•\Õròi\ç\Î:6zú£\0•”¿ß\Ù\í§Ÿ3)ûÍ¥\0\'ü`ø\Ò\Ù3g´×•\İ@ü‹‰¿z6Edùd\Â\ÇS¸pö\é\Îiğy¶øš\ÌıO›{ÒŒŸ½¼\â\0\Ë\å\0²\ïô\çtn–+‰?—øCg\Ì8}¦\ïÌŠóD&\ïÔ¹ó$ûÁk\ä\Æ\Ò;\æ\Í\ìXşk\é\0\Ãj\Ãjj’&0C“I°S„8&Áñ`\0PF>ÇŠ“¨¿7w\ÉVf/ò\Ô\ÇÁHó\íŠ¾9\Ï<—\Åtw\Â\nƒCß¹ñq¸ \Õ>l¯)`\â)=»˜=Ÿ]1bÊ¢æ¹¦QÄ«)\'JLò¯\ä\n*\"zŠ/À,Ái’‹Q˜#½\Â%\İ\ë\Û8®Bÿ*¿¤\Ç\n\ã‘xw\àc\ÛÿA}0T¾ˆõCo“\ÎJ¡=ô,\çñN¢Q1¨€¡°N\\*^.^!^-şR¼Aüµ¸^¼Uü¸A\Ü(\Ş+>\">%şEü+õ$ôšg\r\å¹N\\+\Ş,\ŞBy\î¤<÷ˆ÷‰‰O‹\Ï&“\É÷º]\'\é³õ“õYúLº\Ú\é:	@?Q?±óz¶\Ò=MŸö\íı\ËN?t;\Ó\ê\é/(B6\Ä2!_X.…\Æp\Ær¡€’0•õ€¤\\ö#\á\ã\â´_ ´œ—ö‹Ô²x\Ú/Qmı\Ó~|Jù\r\\Š£`œ§\Ã\\\0#ˆ\í0fR\ì|ŠŸgPo\r¢\Ş*§\Ş:\È\ê\â\Ëy\æ’L\çB\åÁh\â˜\'\çDCTn¨×œ™\çÁ´Qôdù\Ğ}•\ÕN\Ü\íT\ÖºCpqtP-ó8\×lŠ\rA)\ÅF\èYN\ÚD÷€´¡\ãh\âŸKœ§q©F’\ågt¯\É=F\ê³ò³p!!\Í\r\çr\Ú\ÃIC©—Î¦Qõ)[]T?.ù£\ãÿ‘K3ôc\ì…Oº%ü^‚!\Ïw\ç\ÆŒ N\ØI£\á\ÉC•J\åñX\î\İ/Àp\ï!øøv\Â6ô\Ãb¸Ÿ|,®\Ş\Ä\é$\Ï\í·V\â<Ã°<u•…R/e\r\Ç$\ì \é\ÖÀXƒ£`‡<_ôS\Â6\á	¸A¼Hx!™\Ç	+).I¶\êY\Ây¡m\Ü\Â˜Oõ­\ì^\"¶\ßÀµd7ºb\å\ß\ë\Ëu\Æ@M\îƒû\àa\Ş‹`9´ueÚŸ\ãj²i~4aF§f\r\â©\Â}‚\Ğy® Œ\\3ğu\â^)õ­\æÜ®\Ï\Õg£W‘\ï\âxXE¥ü^@_\'À\á˜_\Â-’\Û@#^|\Â7`\×_Æ¿\'¿‚\Í\\ö“À\ÒiO\îMf¸H:\Ü\Ò\ëC\É\'ôEÔ¯\ÏÁ—\Ôû¯ ÿ¨\É\Ô\ãˆ50L?G`œ\ĞÄ£\è¤\çPC)~=)\Ö\İC·€\å0Q\Ê \ÊYF\Ï…Ù³?F¨ƒDûQ¸”\âK\èY’S¸ˆEé°†œ¿ R:=¡	dk\Ê8İ€R¼	·v\âc\è\èÄ¹û1¾\ï]½w\İ^ñ‹\İUÁ²\İkw­»°lWë®¹»\Ö\îÚ¾Kş`g(øş\Î\áÁww”\ß\Ù1<¸}øÛ“ÿ6\\œo\Ç\Ş\ŞFqr\ÙQÌ§²DCt\Ç\é“[0?^\êÏ­KL	ŒoHÃ‚/¿˜|\é\Å\â`\Û«_\Øò‚\È	ò\ìxAŞœ\Ür\Ïş¼zznzÁl«·oFOÜ=ZŒ?9ª>şPAIıfÇ‹\ï„\Í8w3n¾\ß$¸\Ãı¡û\ã÷·\İ\ßq¿\Ì«\ï\ßzÿ\îû\å\ÍŠ\Û\ZˆõŞ¶{…u÷n½W ’\ãY÷Z²\ê\íw·\Ş-l‡™\Ø~¨¥»‘nVE\Ş/-\Ô7”m¨İ°vƒdß€ñ\rYz¸«\ã®\Åw‰;\î\Ú}—p\Ç\íUÁÛ›Šƒ`\0s\î\Æ$Ê¹\í¿Cûmø0z\Ñ\ÃH\îøÏš†oº¾$x#\İ7Ğ½øz¼¶¾4¸ö—~)\\S_´¯	®®Z]¼òŠ\â }Up\Õ\ÜU‹V­Z%ÿ\âò\â`\ãJ´_ñ\Ë-özû²\à2\áÒŸÛƒ­?\Ç\ê‹\ë/Î¢ºÒ½€\îùtG:0Ğb\î\éÀW;>\èfw`KnN\î_\ØA\İ9÷Œ†\àõ\åÁôMöWø&+\Ä\É\Ò\Ë\Ê\Û\ÖZl¥\ç	S‚\Ç×—§M=\'8µ~P\ĞU\îœ,“v¥rqò\\\íb­\Ø(\Î‰r\ëDŒO,\í_Ÿ˜_@\Äå«Ÿ3\áü	+&ˆ\ãsƒMtû#BK\ã)\Âft\Æ\ÔG\×ûƒ\rõ\á\à\Ñ\Ô\è\ÖS\'`nC`²§\Ü=YEûdG¹}²€„XH7£zw@¡‡#>€A{­½Õ¾\È.\Ù\íeöFû\\û*ûv{\Òn¬¥¸]v‘–A´\Äó Œ›qõ\ÆI£\Ñ1›\É	cÆ¦i	\\š(š\Èh|üÔ„ai&OÖ¼ñ-?_¹F\äI”OlN´åµŒI´“\'\Î<‹\É\ã\È\Û\è-ó\Ì_°0šv8{\0{\Ì\'\Ïüù,	YT?Á‚\Ê2?:¢ŒR…ùœ‘x3++ı‡Œ«Wƒœsş\Æ\Ä3/d”‡X,+ˆ;ªa~Wõ¼\äÔƒÖ¨Pô/®&~Í¦\ëNvae\ë“î—˜¾fò\ë^q¯¸W\ê/õ—tÍ”7¤.C{úú\Õÿ\è\Úş\Ã\\Æ²Ÿ®\ï{™f›V\n•+•7\ÍÅ–\ØO\×pM\â\×Yüº-}%\èúÔ²‡®V\Éjµ´\á\×D\ë9\Ö\Å\ÖÇ¬O\Ñõ¼õy[Œ_\rYS²\Î\ÈZ\Â.»\Ë~²}³Cq\Ô8æ©ƒ\ÔÎ…t]\è|\Â\ås\èz\ÂõDöƒÙ¯\Òõ¹\Û\à\Îÿ¯¿:\âGO›\Ú\Ò<y\Ò\Ä	\ã›\ZÇ=v\Ì1£®¯5r\ÄQñ\Ú#‡;bhÍÁ\ÕUƒbeô/-).*\Ô\n\ÂA_¶\ê°g\Ù,f\Åd4È’HsUÿP\Û\êbQH­Ÿ¡\Õi3\Zô\Õùf\ZĞ¿N«oK„f„ôŠµ†¥\ÍH„\ÚB‰bz\Ì\èİ–ˆ\ç¬oq\ÆSœñ.Nt„†Á0V…J<7JmÆ©\ã›É¿r”\ÖJ|\Æıc¹_*\æ\Âa\ÊÁ¥bÒ†\êõg\Í^^\×F2\âF‹y¤6r¦y@\Øh¶\×B¾D©Ö±KD\îJ\ë†n¤}©UK-­›Ñh\Z\ß\\7*·\è?:‘¥\âI0’™0ŒLy‘¡S˜\è°\"´±ÿ–\å—ovÀ‰mQk»\Ö>\ãø\æ„8ƒò.\ë–/¿,¡FmT\"r\ŞNµ|f¢¿6ª.e¥™\ĞUÏ˜ƒUbB.rh¡\å{š£}öiÏ˜\éC‘c/0oB™À	\Ía\æõ\Ô\×Ë—\×k¡ú\åm\ËglN.>Q9´\å­\Ö\åu\Ô\İ\Ğ\ÔLElN>¸\"¨¿¼%\áh›C[\ÒM¯§…kü´\æ„PTš=ƒb\è¯V	„\Õ.¦C%uuõpˆucSóòP\İò£Âp\İ(J\'ofİ³bsN\Ü\rñ²hKBhc)[2)\î\É,eq&%§\ÕH\Çc&6/OHE£Ûµ:\êù3‹O$”\Ê¤9Yûam¹S\rÕ”µp^&\Å\èöSB	¹˜:‹ru\Ï@øaY–;x k_\êñY€*(V¡\ZŠa\å\Ôiumé¿³fû¨€uxC4ˆI´˜\ZEøŒ´\æ\ê6\Æ\Ê(ÇŒ6R\Ü)£¸ReZG\"[Ñ¥e\Ş9§Ll\æY\Ò\Ù\Ù#\ĞvR:W¢¬/ê¾¶Q)XY\Úø\æ \"¹cce(pOTB\Ë(\Æ\ìIh+®[\Ş\Ü>+l´\Óø›j„ñ\Òt‹\Ö<³…Áz(²#ÀA\Ò\Â13©y\ÌDm\Ìø©\ÍCÒ‚¤XqRQİ·ŠÑš©bˆ	S‘)\Ô,\ÄbtPD¨<ÚˆaD\Æ\"\İ\êp\Ë\0<bX¨\á&1‘P\İ\ÌQi>\îQ¨\Ì`5²!Sš©œ‘\rpK8\åô(9”®˜r˜X§6d’\È\\Q‚‰p:²G±¾ô1ğ‡šµ™Z‹6;”ˆ75³¶±\îá½œ\î\Ş\çi]M\ê\ê\ÖY\ÔM¦\äL€uf¢>\Z\èŞ¹‰£y˜\r›„0I#°Ğ¸ZLIM	d\Óø€\r–Z=\ã)*UÒ¿\ÎHŒşn\ÖÑ©JY\Î\å&m\Ì\Ä\åLf--\'P‡¨t>•º‚m\ÚzK \È\Æg¤BËµ\Ñ\íËµ‰\Í\Ã¼&4_8µ\Ğ	cpÌ¤úop\ÄF\r—\ßÇ¥§6“%ñ€ ´tRó\İ\n#\ÛF´l,¤ô\æB\0q+°X\É!`¥M €‰óˆ,\æ©\à\á“6#ğ8S&\á¤\ÍB*Î‘ª¨˜WR¤TJ<\Ã-Qœ)·˜\Çq·˜²X+\Ø8ô\Í&%Ó´Rjg\0¹ eöò¶6\ÈÀC\İC˜@\íH\ê.\íÈ(¬	³6sDÂ¢`ñµ,¾6o`ñF‚&z²÷\Ô\r\ÅP\ÎÓ\å\ÏXW¶1Y\îx€\à¹ÌP\ÓûXoNº¦tË·‚\ÇÍ‡ñ]\éó¡\ìPy…\Û\á‰C¥\ÉOAEğX\Ö-mÕµ,\ã\ç\çF·§Ÿ50©;/—\á=ğ~«,\ç¿n\Õ÷wTWS_•ıct¤C\Ç-\ÃO\îÿ3\\µ\Ò\'\Ğ$½S\Äga¬|.4‰W‚S~\àÿ\Öøû\Éı\ßud{\Èø\r/±7uiÿu\Éºóe\æRyL\ÌÌ™9”=).+3òülM\Å/“ƒ©™ù33o\ZN…‰^6\Å`,ñ\Ì\É\Ì\É<~>˜\Ä\r0‚\ÅKa*K“Î‚U¯H\ï\Ãjz¦øh¾”¾‚s¥4J·Á\"\éz°ñ:şã…š\ä\ë]<”\Æ\âş÷z\ï\'÷}œ!ı€½p‘9YQ@Ÿü©eüÓ”˜’:( 5ƒ™¨,\ÉN°‚•¨\rlD³8µCVò\0­\ìDUN u“h6¸’ûÁÍ©\ÜD½\à!\êoòğƒh§ğ\'¿†\\\È!š¢ùK4yDCO4A¢Jş4¢ÿ€B( Z\Z\Ñb($Z\Âi)@1\Ñ~P’\ÜQ(M\î…şœ€~DB”hô\'\ZƒDqZe\É=4\ÖbD+a\Ñ*¢_A5”L\Û\ç¯`T­*¢C‰~	GÀ`¢\Ã`\Ñ\áPCôH¢_@-%\Z‡aD‚\á\É\İ0$:’\ÓQPK´\âD\ë\á(¢Gs\Ú\0#“»`4ŒJ~\Ç@\Ñ1POôXN\Ç\Â\ÑD\ÇÁh¢p\Ñ&Ct<\ÑOa›üŒ\ÆöX¢“`\ÑÉœN&¢\ÇÁx¢\Í08[`\"Ñ©œNƒID‡)\ÉO`:GôN[¡™h´$ÿ3`*\Ña\ZÑ“8m‡\éDg\Â	DgAkòc8™\Ó\ÙĞ–üNDO…“ˆÎv¢§qz:\Ì$z\Ì\":NN~0›\è™p\n\Ñyp*Y¾ù0‡\è8\èBNÏ‚Ó‰\rg$ß‡s ƒ\è¹p&\Ñó8=\æ½\0\æ\'wÂ…°€\è\Ï8]g%ßƒ\Åp6Ñ‹\à¢Ã¹D/\át	œGô\çp~ò]¸.$z\Ñw`)üŒ\è2XDt9,&º.\"z9§+\á¢¿€%\É°\n~Nt5\\Jô\nN¯„Ë’\Û\á*XJt\r,\'z5Ñ¿Á5°‚\è/\árŠ¹V½~AôWœ^«‰\Ş\0W½®L¾\r7qº®\"º\Öı5\\Cô7ğK*\çfN\×Ãµó[¸\è-ğ+¢·}nƒ’o\Â\ï\àFò\ß7½\Ö½“\è›p¬#ú{ø5\Ñ\rp3\Ñ¬\'º‘Ó»\á·\É7\à¸…\è&¸•¬÷½œ\Ş¿#z?\ÜNt3\ÜAô¸“\èƒD·ÁCpÑ‡\á÷DDò5x”\Ó\Ç`#\Ñ-p7\Ñ?À=Dÿ›ˆş‰\è«ğ8\ÜGô	¸Ÿè“°™\èSœşH¾OÃƒDÿ}I¾\Ïrú<Jô¯ğ\Ñ\çaÑ­ğ¢/À“/Á‹ğ\'¢/Á\ã\É\áex‚\è+œR\rD_ƒ§ˆnƒ§‰¾!ú\Ñ\àMx†\è[ğ,Ñ·\á¹\äVø§\Û\áy¢;`+\Ñw\à¢\ïÂ‹\É\ç\á=Nw\ÂKDß‡—‰~\0¯ıÓ\àµ\ä_\ác\ØFô\ïğzò9ø\Ş ú)¼Iô3x‹\è\çğ6\Ñ]ğ7¢»a;\Ñ/ˆ>_\Â¢_Á;Iöù‘÷ˆ\î\åt\ì$úxŸ\è?\á¢_Ã‡É¿À7ğ\Ñığ1\Ñğw¢ğ	Q\èÓ„O‰şd\Ó{³\é{¸M\ß\Ãmú\ï\Øô¯¸Mÿ\ê;6ıKnÓ¿\ä6ıKnÓ¿\à6ınÓ¿\à6ınÓ¿øM\ß\Ímú.n\Ówq›¾‹\Ûô]Ü¦\ï\â6}·é»¸M\ß\Åmúg?\Ùô\ïe\Ó\ß;l›ş·\é\ïp›¾ƒ\ÛôÜ¦\ï\à6};·\é\Û²\é\ßÃ¦?ü_lÓŸûÉ¦÷©M\ß\Çmú>n\Ó÷q›¾\Ûô}Ü¦\ïûÉ¦ÿg\Ó\ßûÉ¦ÿd\Ó²\é °÷wr¹|ˆ`„`\ÜfdQ“,JUû\\\Ùsªkj\Ô\nµbP\ÌV\Ã.5¬>\'\Í\Üı±\âsòE\ß,’«ö{¥\Ùÿ‘L_K-\ÒFšŠ\âª`E›$Yº«E‘\ï†ÚŠ¨\n¬4µ‚—†ª¦†«\ÂTt\Ø-<õ®~&®z¯jô\Ùx\í¼VŸ½ƒ•º‚È8ˆ„ñ\Æ\Í\"Py€\×O(‹¦Š\Z£ü\ê\n\ã ıyj\Ïø\ä§RP¾†¤@i<;[¶‚y¹Šc~‹b}ó[D?\ÔFÁW\í\Ö0tZH­tVW”;±²¸X+0\Ü\ÙOEyuµÜ»W\Ï=õ\å\ßó‘şAñ¤¦\É\Ç•L\ßt\\‰ğız}µğJ\'Æ¯Õ¯Ñ¯şÓ¶Z_û\Ó^?\á¤7\Øgº“K’£®·\r\\w  È‘k0Dú©•$zP\Å\ëT\\ªb½Š\ÃT\ÌQQQÑªªb\Ğh\r61I\æ QTæ·„Œm\ÆcÂ¸\Å(ÇŒq\ãb\ãj\ãV£l4²U”M?3\Õ*¨ğ•µ0]uÖ”0=å¨©PC\Íõòæ¦›œ-i…%E¬U•ÅšV•öŒEÕ…\åw¶Á\èöx¤ˆ~`÷{ú/\æÙ±ô\Ò?÷¼Ó›c\Ò?ô °õ\í¯¯¿ò7ğ²\'·½ğ„ÿ™ö“Oh\ï¤\ã;©­9û¾¿>•Xr{®\ä\Ú@zy‚ôø¾df8\ÃñE£QI1!\Ü0ÍeØˆsq\ÊVã‚”\ä¦I«lS°IÁ ‚v“\n\îRp«‚[¤¤VŒ)\n\Î~^Á\ÇÜ \àj+Ø¡`m&\Ï)8—g \î/e;\ç_\Çù\ËxTÊİœ›JY\ËkXÔ­şT-<Cª\æZ^–ƒ\çLU¿6S7e‰ó\ê\rL?³\Ë\ÍË¸o§}\'>•@H_Y”T\Ú±l\"\İO`Hß!a7\æ\èt:Ğ¯\Ô\Û4ª¯ Qm»`Œ\'mVÁD]/J\Ù$™Œ¢C5Z…\Ö›I¶Z\rl°;/UqŠ\í*NTq¤Š•*©\èQQPñ+wªø²ŠO¨xŸŠ7«x•ŠKT\\¨\â,\'©X\ÇùUt«(©8{¯Š\ïg2Ü£\"¬SñJƒj8Q\Å&G¨X\Îs¤jØ­\â»<\Ã\ã*Ş­\âzW«xq†‚Š£T¬\æüÎ¿‡Kôj†ÿ7*®Q‘ZpoAŠŸ$*V1[EC|®ŠC¾\Ìdù£Š›T¼…Ë“\âŸ\Ä 1;UD\à¥S¹	\×ñrS\İÒ”)4›ô8/e\r/¥ƒ3ŒJ	GùM\'Loş]ÍŸ9¯u^wwP\Ñ\ße\í	•yéœ‡\Îµ\åµ5eÎš\n†–ôXO\rv\'a¦¦fP,,\ÒEvyK¤\Ó/\ìüğBıuAÀ\ã\èœ`0\çŞ„W¯ˆ\âlıZfÙ¥\Û<…\Ç\ë•xõRf‡—¢„(,ˆ#+\ny\Ğb0‹F¬6\Ù\Ô\Úb—\Éke\Ñ.¯’“ôe{´]\ÆlYöXG\ËdµQjmA”\Öp\Æm³aÈ†Ô†.s5iœ\Ó}f”·²Š´‘w‡\Ó÷2iÒ—„İqŠ|\ÑNı¦úÊi	‡s	O\×EQ2X$‹\Õf\ÚZŒ!÷\Åc‰\à\Øx­‡\Z\ÑhT8ğ\Ûl\ØdC’h±\r;l¸Å†\ëºI7«!İ½Ì–FÃ”h$R\×%y:¥¿%\Â,º\ï\\/_\Ôù¼0\è›E\é\ÄŸig\Å\ëøLF½\á\Ü!S$®“qµŒ‹el’1.#È¸[\Æ-™¤\Ûd\ÊH\Ì[3ñ\ÄÜ›õ€\Ú\Ú\î\ã2,aº\ÌhpïŸŠx€õM¤F‹‚S!É’itªŒƒ³o%\Zy€¤f\İğ{\Ş\Ìó±¹óa…p\Ù\Ï;uj\ëEÂ¢\Î;¼”®\Í¦Ú¼xz<\é¯Ã–\å\Íòû$³\Ñ\åu•¸D“\Ùg.5‹Š\Ùå¶‹Y&p®ğ\ã?ñ\ã~øq¿wùñq?\Ş\áÇµ~¤\Ô~œ\æ\ÇF?Vú\Ñ\âÇ““~\Ü\é\Çgüø7øq\Ï÷\ã\\?òcÔAÎ´Çoúñy\Îó\İ\ná¥¯\à§ñø2?J~ü	O\Û\ä\Ç\ëyµ”§Gy^\ÎÔ·„\×\êG!\î\ÇZ^\án?\îàµ­ó\ã\".*Å‡üxø»MLc­ÿ\Ú\ækğ÷÷™\á\Î\0YC	jE\Z¤&\Æ\Ê\êÁ‚Q\ÔD\Ñ\ãf\Zsy½ƒ1¬\ÊT.\Ğ_\Ô\çXõop\ÅO¬E\\&N\Éú–şÕ©>xöGc\Ü._t\à\ÓcyW<‚¡F`»?ù=Z\ÇXio\Ş\ï\ï2\ÚhRñ\ç˜­-fIò´¶H®u9¸8;r°-\ã9\ËÁ\İ9\ÊÁLczYoe’\Õ\á`¥ \îl\'-¾\ä÷~¯?¼Mß¤_†\çĞš \Ï\Õ_\Úö§\'·½ıØ“¯	O½¥ß½/\ÃI8/\Ğ\ëw¢¨\'?øHß‹I\Êğ\í\àøv‘¤»Á`´’¬\îl™d•eƒ\Édom1‰\çb7v¸±Í17İ˜–±\Ëu\ŞLRƒA\ãc»\\’+\Ã\ìY-;.øp­ş²œ\çv¢ª¿¦£?5\ç-ÿ´ôÕ…:‰ğñ\ÓŸ\ËF—†ùsl\ÆQñPH1Š‰­‰I\"©…B¥‚…4Ü£\àN¾\ÈØ¤\àzWğ\ÅD»‚“<\"\Ã3{?gz&³zYÂ“GñRRE¼\ÉS7ñüœ–\ÉLò~Â—P+x=\Ï\àñƒ÷ğ<ñX\Êv>_0\á9£¼\\*ô4\Ç[ø\ÒJ\ØÎ—>«¸œ©µt[ô´Nÿ’ÿ\Õz¨\ç\ìvP+|\Ó\à­Im\Âl\Ë\àeıu½FºOºqÿIÒ;™õw’öGq\íG\ân°¢I¡u¬X$³Áfe\Ö\í\ÛV\Ù4\ìú“²ô›\èú3~¤…C°†®j}¾\"\"ş¾pƒ…_v¶wØ˜h¢=\ÆU\Ò8ª\Ë\r±xj°‚¼\Å\ŞØ¢8\Ä\ì\Æ\Ñ\Ó\á\Å6/öŠ}}Aô‹iß‘\í©IW\éo\éz\'[\ËÑ°TĞ«¿ñ³s’p\áY(\nùú\×ú+\Ø\r(cTß®ñ‡\ß\ëW\Üû“\Ä!m®——ó\İ\ÛñÉ´¦%j9\Í ¸rš4\ĞeP­°ˆ6”\â\Ña\rGˆ\ä\ä5€ƒ/x|\İ\Ú\Äõ·;³\ÈmË¬­:¡›B\æ\Ñj4\Z¥\é¹<³™Ë´ªª\Â¦ÿøz\ç\ÂW¥\ro’c\È\ä^\ÃDy˜ ü<ô\È!WQHœ°İ®\äˆ\Ñ~R±«¸µ\Å\ãŠgKr‘¹¨µ%hV\\¿Œ\â¼(Å‰QÅª(G\ÑE9Š_Eqg_‰\â“Q¼/Š·Fñš(.‰\â\Â(ÎŠ\â”(\Å\ê(–D\ÑE1Š\'\ï‰\âûQ|5ŠOğ7GVGñ\â(.\à9&ğ\ZbQ,ˆbv\rQ\Ü\Çk ›¢xK¯\äÅ“8\í¼øxË£X\ÈÅ‘8óQ|1Šó\Ò\×GqM/\Í0Wv+vğ—Q|7~|_\â£ˆ	\Î\İÁY›¸^\âNÎ±‰\×J\"NŠ\âQñR¨)oòš¨ó£8\'Š\Óx(-;£l\àõ²\ìì±‚ü\Öò\ë\Í\Ö·B…\Ú\ç8|µ9\ä‡\ïñnc+=1tk*m+±Š¶š\ÅU•® Á[\"›l4Í„ü\n•vœr¿›~\ëÊ¹v}\çš\ê{ô}—c5û¡§\æ\ã\à\Ëõ}÷Tw®¹ùº\×ooŞ¸öö\Î3\ï\ì|ø©e_¯Û\Ù7İ¤ºÿ\×ÿ\\ö”ğşº»„U·§\Ç\æ«46}Põq\Í\îp¸|VW0\è7x\ÜnCq‘\ÇMÀ+hl±\ÒH\Íml\Ñ\ÃN&hŒrR\Û\éòT3¶‹h\n(TMPoEõ\à°A0:½\á\â&yõ`~^ \ä¾ü\Â{o]òHLô—£R>\Ç\Zš­9È£{\'·µ,vz6\Ï:\î³\Ë\ÎCú1s~~\Şs§\é[\æ\ë\Ïüãœ…8ğñ\Ûÿr\ë\İ\ßM-˜B-X\"?K\Ö%‰\ÙQô\å«¨ª/TÅœwnÀškml\É·\Ò\Ø\âöd\Ì“4‡U\Ôt›Äœi\ÛYY\\\ÂO5Hd±=lO\í‚*G2“z\â´\ÓV^sA\Ç/¹\nG^2ÿ¢}\ë\è\ãúŸ\Å\Éø\áOVşÚW¬»Aü£Qó\ì\Î\ëÖ¼ÿ3T>ÅŸ­Ã¡W=\Êfº±\ÉO\Å;¨\ßKiu;$_-.°©¢\Ù+Š\æ~[¸ \\0¡\Å\Z\Î\r1\Î6f&´\Ø}h‘|¾l‡Æ·8£‡Ÿcpe”¥ö»lB\Îø\ÒM¢\æ”s­”öf\ÑÊpU=¸ª˜=˜~Œ\\¬™\î\Ô!µ|Éª\Ñg_\Óş\Ô\Û7^rö\Ò·,»\ï\è\ßô›Y7©y\åCk.1ù¶e—©/½\å—g.³\ÖKOıù\ÇN?¿f\ÈQ5ÇŞ˜_wd\Ã1)L\Éã¥¡\à€\0”Å½^ƒj!ƒŸ›g\ÉV\È\Ø+v\Ñ\ÏL~wddüœ%œZ\é„\İZ‰\Û\ã‘+K˜€Rƒt¥şnÈº¿‡\Çb…pñŸ\Ö77\éo\Ì:\æ\êÄ¾.Á¿\ì\ĞÑƒfšŠ5Hg¾:f\Û\æ\Ç\ï\Ô×­g½\íL~\"vD^\Âx?UE‹\Å\ãñû²³\Z[²=fš\Z[ŒvZ‹n\åk\Ñ\Õ~\ìğc›?µa`.>r\Ó\'hª—‰Y`0VUWW°ƒ\È`/#¤ª˜5a\Ç7§R¸U¾\"^õ\İ_E¼Àg{Òª>\Úùp\İ\Ó\İf\':„‹X?\é\ÇÉ§JÀa¼!Ì \ä’d›Ã¡(2ˆZ-×›K8ğ:‚.ƒk|‹hğHe\Z¥\á\r\ë5,\ÖP\ÑpŸ†hxŸ†K4\\ \á,\rk4Œh\è\ÑP\ÒğdJ~ZÃ‡4¼F\ÃKyf\â­a5ÏŸ\ÊL›4¼E\Ãs5<E\Ã\rGq*}¿†Ÿiˆ[5\ÜÂ™\Ök¸B\ÃE\Z¶s¦J\r5´h8x·†;5|F\Ã\ë9I2M\Ã1\Z\ÖjX¦¡\à\Ğ4Ü¡±’\Ópƒ†«5\ìĞ°M\ÃF\ÎŠ‡5´kH\ål\×ğy\r\×j¸JÃ¹<=Æ“Œ½,û™n\í}M\Ôú-¶^x2\Æ9u\Ø\ê\ë:s\í²\Ì]kY\Õ\ÔBP+L\Ó4L¼*?NÙ¡¸\Õ\êjùTıcı›\Ïõ¤şå¶\İ\Óg-¾\à÷>¶Sÿl\Õù‹—Uú.ı5›~\n^m!mùf—\Ü\ã{ú¦\ÄEğ>ù¬ş\æœóa\ç\'†?3¤> ­Å¤¼d(‰\ç€Á(—O³\Ëh—\Ë\äZ¹•Ÿì’2”¥¶ü5ƒb®*™£\êß–Ö†±°Hß‘L²Ï©\Z.‘/†(\Å©`#~–\\˜¼	Š7a–ˆö\Í\É3\âN»±ˆ/x\ZaH\ë€\0_U« ¶\n ™L~ü\Ô0’ö2\ÅPŞ–*a\0•pt\Ü\'DÁ/ù³ı…şJÿ(ÿ$»‰_Ùœ,\çøıFc-¦;/º¤$`+6rUU\Ñ\é\é*¨\ÌÉ›` ù‡­\Ğ&Rø4Z—Ê•ñƒ€`Î’e³ :\ì\n²A4´µˆN¶V\âÃ²\Âyğ¤6¥+\İ\áÁEX\\’%Š\Â`lÁ·¾ùÅ¿\ëûjr\ĞR8t·|\î?ñ\İwÂƒ\×o(:cm\çeLôy\r\ÉQ\n™ğpf\Â\ì4‚\Âı»\Ò7ñ0ûD0’´(7P›aHœ–d’Ñ„´Š“D«ERDÚ®o±\âZ+¶Y±ÌŠ)£R^\ÛıŒ™Y\è0²)‡V\×a¹A^\ß\Í\ËD\ë\×g\ÚU ¸ğ\ê…\íw ¾J\Õ\ÎN¨ö—&½\ë¤p9@·³#hq•c\Z%\Å$m-ü‡\Õ\İ}‰\İu\Z\ê\\¥¿!m’V\îŸ\ÏOA\Ò\ítğš*x\ÉSi‡¶ŠJ¶4#\ÍW&A0 -¶,\Ñ([[Š0K\"šÁ\ÌN®2\Æ\Ó\ÉüAc\Ï\Ù*\Êù\ÄTQ…lB\r£\Ãî©¸E/~\Øy4\Î\×\Ïm\Çıx\Ï\Ç;õ—\ê#v’4\éı!I3˜·;½‹¡ğ\\:BÁKˆ\Õ\à\ØxQ¾\ß`ñ[\Üv7-\ÍbX,,²Z}¦@N µ\Åg\Éq‚“\ä“R³PJ4Z”u;H	\É1E3R¶`L™û\êô±?7´»*÷U«hR:\ï\åW\ç\Å1»sÆ½¿\ÙöøŸŞ¸ù\ŞÎ™\èyÆ¶\çñ<ù\ZıQı£Wõ—gXvbÕ”\×<óö[Ï®ùpŠş\ÌNË‰8\àZ\åÄ©E|=&\ïŠq@j\Ô\â8jYv\Ü*©\ÅB‘·¨\Ô\à(bc4\Ê\ÇhjAö¢\ËRüğ9\r#!ÄˆZŒ‘q‘şf±\È{$övL\Üf\å\ÆúÇI;R¾a\ä?>vZ\ì‚\Ø\r±;cÇ½û4v f\Ï\íJºœ2\Ñ+ñ=L19ÁXm¬5&\ÚcÁXY¬167¶*¶!ö|\Ìt_*¦–\âZ)vÅ¯=F)\Ûc»bÉ˜=\Ø#‰ea\Ñ;/\å1\âJ\Æ—\æÅ†Ç¦\ÇD[,/6 66vzleì®˜ñ©ğpŠ™Nq\Æn\ä\rû,\Ö³\åu‹&\æøK±\çx‚\Å\ÆKHqvÆŒ\' {Q/‚·÷.8\ÈüVô\Ş\"&¸Í.%\Åi¬V\Å\Ğ\ŞUÎ¢tJ\Íw\ËNµİš) {É©¾²\Õv•À8\ÓÏ¤\É\ëLv\Ü\Ûı\Ù3\ÈV„9z³\ÔÎ°$x\ÒXZ”\Âú	şùş\\«·;–˜\Û\Çù\Ù7\Zğ³¤¸\Í\Ämv›m¢’\á&\ÛFe\Ï\ák¼mñ[³Ù–eq\Ğ6\Z\ä,Ñ©Zd‡- €½Ñ‰I\'ZœG8‹sŒsšsó!§|Z”\"\Æ8W8¯w¾\é\Ü\ï4!\Ï”ğ¦ó§!\Å÷S\Z\Êx\ÎOs®O3%“\äœ\ä\æV:G\ÑSdNq¸\ä\\\à\n)ns‰óe§,9kœ\ë)m\Ó`\Ü\âD¡õÌ®K{\Ø=¿(«¨\è>”§^ßº<ouõ`W\r\Æpõ`ö{9«X0”8Ÿ\Æ}\áô|ıo\áQ\Ò\Ğ\Î\Åı\îˆ\\[-œ¿ÿÀWŸ¼ı*õ\Î}®¸Šö$4‡ysB!E\É¯·P\å\å\ço»5¬›iUQKv±¦\Û{\Şò\Ì)Z¾\à\Í\Ø\ÅfmŠK\n´\Ä*#;\Í!İŒ*=zÆ\Õg8B»pdòk—¥……²HBxDß£\ï\Ä[†\ÔEó¥\rÇL9\æø\Ú\Ò\êÒ\Ötqû	6Iz\äQıŸ:û\çZ¾ûkŠ\ÇÀ\ç0™Ÿ’\ãwdgKM-\Ù«]qC`]®\æg”‰Lù;rpW¦8\Øzmmó\Ô\ÙS\ÊJÒ¼RY¦\íSE5\Ûp¸Uq\ìøSæ¯Pˆ6\Õ-\Æo;ÿÁ[HŠ¼«\çİººó!q\âù§•œ\é˜~\ïŸ÷_\Æşb*Ù·¯\ågh^u€›æœ¢l›\r\\YY2ô­\ß\í.ˆ.—\ÅdRÇ·˜@´Œï¶·\è¶!\êñ‚½Àf[\Ôp¹\Ë]$«@\â×»w\îø_Øµ]ğ Q¿Llş€\Ï3\no\ë—\è—ã…¸@ø\\_u \ßıøki>_Ì¼§øŠF‚\ÕqM1hsa–\ì\àZY„]l³¬³$,\âb\"[,[-R\nr\é·|¤Í˜Ê¶Ş§òC˜-\n]V\';ğ»a‹JYù«h\Î[H\å[he\0S£(f¶´°	F3k“l—¨sø;—T#1µ‹\í\íe„xŒşö\"ıCšnV¢¦/Á\ëğ©Sõ›¥¡º?\×\Ë;\×ğ\ï\Ói’Áƒ\ÑøV\Éc¦Ñ®(`V%ŸW2›]\ÔıM-.Ü><‚v¥>Lúğ!.ñ\áNó\áVòø\ÓöûğM^\ï\Ã<–¸£>ü„GR†;xe[\à\ÃvÎ)¨{)C?É°®à¬©4É‡;|(lõ\á.öa‡\ã>ùp7OxÌ‡\ë|¸Ú‡s}\Ø\È\ãƒ>_÷=Dzõ\ßú\í·\n\ß\Ù3t?…¥^.Kãª¢\çò-\Øò\Í(†q ¡‹F.\Û_K“ô7~Um°öİ§¿†oY;€\æ£É³\Ö\Ü6F°<R6t\Û}¢øù¢_Ô¸ş˜¿v\Ó÷j½MšNúÎƒ\ã\â²ßŸ\ã²\Û9`¾_µ;&wS‹E6yÀ½.ˆ«ƒ¸;ˆ‰ ¦üA\Ü\ì>,+R‡4\ß~7P¬\ÒZAq‰–zç¡²\İ5Ç W²$Š\ãn«<\Î+I\'›gœ‡~“µUµû\ÙX¿hƒ¾R~£óf}ç­«…6_\Ü©o•¼$s®‰\'iµiÍ´‚7Òš\İ*Û’{;pOt\à$p`¥‹\èt \äÀ=üÀ/:·8p“\×;p5Ï°À\ílr`œgppî“‰}‡·:ğqÎ½ÎTü¶ñ²G90\äÀl\ît\à\Ë|†3¬\æ\İxb¶\İ\Î¯xM¦\ÖT•…öe€ƒ\â\Ú\ÂYóbZyºƒ\'’ x\rs¹¨µñ°\Ë˜t\à.>\æÀU\\”Jq`ĞvG/ûØƒ‰\ß=\Ô\ï\íWÏ“\Æ\Ö¬P[Qû-h\"-^Ù«\ìjg³Å’÷Õ„¾W?#(Ï1}\å\â¸{ô!/IC\Ü{\æ\Üt\Ù\'¦W¢WI\ãhm=\ï\Ì\ÎÕ“n–\ZA…\\(‹ûœ\à#+\æü¼,wcK–C	ˆ9uj¿ıZˆFD\Zm•@\ã\Â)³\ÙAU\Ù\éštóş>ŸÀö:fv£şı\Ë¾5ÿÊ“\Ï¤/ô×—\r«Ñ?ßƒ+õ½\ë7şUß \ïşÙƒ„¹Fšc·‘<EP÷is\èWü%\Å`Ï³\æ4¶„Byô[‘\Z°\Ïø23¬—\êuM±RÿD“\×\È?Ï„“ú=õ\È	×3l\àİƒË¦]1\ï\ä	\Ã\n®ø\â†w~¶¢u\Îø‹›ğ‘¡\ÇT¹}ıW9üú£9ş\È\âª-¿,>õü	÷\à˜ß®¼ºı¬H\ÊEÔ‹“hd¸¡.±ƒ\Â\ç-§\Ñ.Z›¨³\Öyqµw{1\áÅ”¿Ã‹»¼\İ\Æ0ßô|\Â\Îğ\ÔÔ±I.Bde:“»\ßC\ëi\Ú\Ç\ÂüÊ‘\Âú[ú+o$,\ë¼r\é²G\ß\í@\ßq³õ\Øhµ\Ñ|{…\Ôù09^\î\Ê\ÎÎ³˜”<E6\Ûİ†P0[F»=h\Út\ÛE·Û”m	˜\ì\Ó\Ôµ!la\æ#µl\ï\í­`\íş\nZ8•Óº\É\Ë\×M3F±$m?>föŒ³r\Â\×cD_†7\ê/ÿ©Ì¯Tf\Ñ\Î?»*^])-,5u\Í;9\n\ë:\ÇØŠ‰Y\Íy‹òô1\âğ¯N›q<Æ¾£s|òSÃ™¤ÿœO\Zl®’’\â Ï—[¬\Ø\äH\é¹,\ÔG¦DfE$%‚_Gğ¾È“‘\"\â²\Èua^\Û#8%‚‘HMD\"8{__\à3ü‹Ÿ¹4rMDª‰ !R>ˆ\ì‹OGğ¡® KN‰\à´fµTGª\á\ã¾Ák\"¬\Z‘jŸ\ÃË¯dH\ÉCöGğ\İ\â\Ö>Á;\"¸6‚\çs)\ÆD°6‚H4\"ì ˆl‰ìˆˆ”\Üi‹,ˆ”lŒ´FE‹l\È2‰\Å\Ån³X\à& »nO\îıŠY\ß0; \ë$«¢\ët™†¾5Õ±3³\ŞN\Óz™ñ\ÔôRÂ™:OÃ®¸d0\ÍA\ìs€%š!Lk©JHŸŒ±äª°ø\Ş	“gÿós½_£u\çóú§GKG\ëŸ>¿­ÿôµtz\ë”(\à¿¸\á\æM¿y\ÑûH‘¾u¯\Ô?úüsô!\îÃ²¢‡¼\Ï\İz\ï\Í7¬|ˆC±o\Äm——gö%ğ‹§òâŠ€fÚ™˜µ9ùÎ¦,kjwB\ÛFø~†[0¶ŸaŒ\ï¦¤÷\Ò\Ê\ç‰{ü\è¾ÿ\ác•\ï\Âi~_z¿Dü\è1›Ÿ#ó¦ø…iişR\â/R\ZõÙºø	±ı’Ÿ\Ê“-B<6\æ£\Õ\érù³¼^k¾e7\Ï\ÛØ’gw¹©±E9hH¡koRqp›9uN73ğdİ«\nÒ§\ÒÒ¶!±\âaÙ§.\\¹L¿º\ß@ı¡\Ñ\×F\æZ&+\â÷4¶nö]½T˜Á»úš»ÿ^Rôd–}/1µXXm1› ó=\îüÿ‘Y\ÈÀŸ\0])¦TŠ‘½L5ƒ\É\ì\ÛÁSw/\î\Ñÿ‘\ë\å\ëDN1\Ze“¬ü\Ğb|Gİ«ğ?öÿ*R¨\Ñd&¿\Éh4’\Ú(\Ş(“’5ˆ£‘8ŒƒR¼¡Ï›\ÍPfµ(=ğhş?ƒ©nx¤S\ê\ç\n”t0ı•\æ\ßqÿÿ\â\ÑB\êùoÇ£™ÿ‘\î#)\Ô\Äğ¨(H®Z‚Ç£ğhLã‘’,„	£¥¯…cıj³š{€À\ÄBñ(\ä¤Eö\éOs:‡P\Ì!`ú¹7­&“A1˜h1¾¿£\îµğ?öŸ|IIQ(`&@R€\á\Ñd0Iœ\Z%#™Mf:)\É*‘\Ç\Ú\×Â±~µgYz€€\à0@™º\äO\Ç2n‹DM±ƒ0d\î^\Ü\á\Øù0òö½³*Š\Ñl\ès\Åô£îµ±_ aJ²˜Ù‡¶¶˜\Ù~œ\Å+F…\áÑ¨˜$;º#¤\Í\"C¤dõµpl˜8²¬\ßÅ£Ò…)\ÃANºi˜XYĞœ\î\Åıø‘\ã\Ñl6Yş\Ëñ˜\Å!Iº#5Z%«…\á‘\0i\æ¦\Ì&3Ç£™L§‰&Bjp\n\æ¾\Ç#\ëW\Õn\ë3ı<\Úú†\Ã\È\Û÷.‹\Ôc\íû‰«\ïu¯C²mi<fu\á\ÑÔ…G‹BI\æ>\Ç#&.5«-,dé‚šñ \'“›}F»\í`To\îpôõ\ãÆ£\İjUlFû-\Æ÷wşk\ì\\mE–EÎ²©l\Ñf#X\ÚT­Š•\Ğ`Q¬f\Ùbaˆµš-PeB¯\Ú\×Â±~u»=@`e!k¦Œ9	·Y2ùTš\ã!…\ÅCŒ˜CÀô?r‡³7\ï{§\Úl\æ,\å¿FşcYvB!)\Ô\Îğ\È~\Â\ÆM\r\Ø\Ì6†G³\Í\"“\é$\Ú,V+¸d²¡®¾\rŸ\Û\ÙY,d\ë\ÂT:EMq«Fò¹Á\é€DñMÉ‡£¯\ÃÙ›÷½s\Ù\íG\ßŠ¾s&şC”\ìW Uö\ÉoÕ¨:\ÜQÕ‘e\'m\â\ì;\é\Üf±ÛŒ6M„v»5+\\FBoŸ\ã‘}kÀ—\İ²wa*½t¥¸³M\Ô70C\æ\î\Å¾~\Üg{\ÕasZ³ÿ=\ã\ÕQ÷z©ÀT\êr’B³„Gw¶\Ó\á$mz\Ø \Z²¬ª\İd\ÏRi6T³ğ™½¾¾ıˆd\ß\Ó*9ºL_7<\Ò\í6Q?x\Òğ„CŒ˜\Ãù²ş÷Ù\Ï\é\ÌÊ¶ıã‘º\×\Ï\ßÌ‘\î\Üôgr»(\ìq»T\'\ÅTYNB:‡\É\ápª\àt\ÚU•\áÑ©ö9\Ù0	|=Œ’‹…œ]˜JÃƒ}½5¡\×c\"_\0˜I\å6ÿ[¿tÛ­Œ\ï\íúü%Àa¹œl—İ“\åù¡\Åøşº7@\Í\0¦R¯›\êuS\Ø\ç\Ív±‰\â³\í.Ò¹\Ó\îR\ÍN§KW¶\êtB™¬iN_\Ç~\â7œ\çÿWxLÃƒá‘´\àUhhåŸ\áĞŠ\ê\Íıøq\ã1\íğ\Úı?´\ß\ßQ÷\ærH’J}R¨Ï“G@ğ¹³	œl…­“³ŠÓ•\í‚\ìl\Õ\å‚<²]y}-\ë×¢PnI\Ò\ÃB\î.Ó—\Ş\ÖR\Ü…|A`\æ=„b¼½GÿG\î\Ç}¶—\çõ8ı\ê1©{C@*d*\røI¡?ò~—´™Oºsz\Í\ìĞ›mv»È‚z½.‚fğz‚}-!ú†z€À\ÏB\Ş.L¥OtòR\ÜùVYƒp.¤ š\Û{¹‡c\Øûü\Ğõ°\\A?;\Ïú¡\Åøşº·H…L¥ù¹¤\Ğü\\\n„ósı\Òf[‘\ä\Z¼®¯\Õ\ë\ÍñBN\Ç\çƒB+\äø\nûZ8Ö¯K´†\Ê\é\ÂTz[L\İ!+„¡\nƒ‚\è!F\Ì!`ú¹÷\Ù^an®\'\èş/\Æ#uo	@10İ…ƒ¤\Ğp°ˆš\æ\æQys=¹„¿;\×o\Ëñ\çú!7\×Èb\äŠûZ86LÊ£\Å=ŒR\åvaJ=\È&¹m4º\"PB^\æp\ï\åaÿqŸ\í•ó}>7}\ç¨{£@*d*-“B\Ã()\ç‡H›¥¤;_>¡!×›\È\Ê\ÍÍ§\ÕY0‡ \ZÍ‚`n´¯…c€¯\éa”B,D\ëˆü.ù™£\Ã\ì|‰F\×\0š\ãSŒp\Å¦ÿ‘\ë³vü_q‘p8§\ÈWôC‹ñıu\ï@ 2•–’BK\n)Ğ¯¤0\"m\â\Â9aBC¾?œg\Ï\Ï\çA8œB\ÔNÖ´\ÏñÈ†\É\ĞAı{¼g)`¡P\nnĞµUfœd\çû9 ûJxòr“Y\Ò{¹\Úa\È\Ô\ç/\Ë\r,\ÔrKsJh1¾¿£\î\ì›&H¥ıJH¡ıJ(< _‰¦‘6\ËØŠD#4„Z\Ğ\nkA\Ğ\nó\Âcÿª\ëk\á‰0²¦¼JX¨(e¡k[3 u\Ç\\Ô”\Z¨dÁ\Òtt/.r2ı¸\Ïöª\"‘\ĞÀüÿñ\Ç\ê¨{k€}\é.F®\Ø\0\nW\Æ”–RL5\é.!4#…®¢¢HD\"ZI	qA¤dH_Ç¾&eL|Hs\íş,\ÔøúA\ê$Ÿû§ \Âmµ›D®…¡\ì›[¦¢zs‡£¯÷Y\ÊĞ\n+Â•?´\ß\ßQ÷\Æ¦\Ò\êrRhuy-5«º|À@\Ò\æ06$4D´w¿­\å,\é…#\İ0°ÿ‘}-û™ñ‰\rGö80Œ±\ĞÀ.L\å\ä¤A5\ÌK\"\rG±ñU™Š\ê\ÍUôı¹Àa\ä\í{7ª¢¼¤¦h\Ø-\Æ÷w¤Ï£©ÀT:l0)t\Ø`\n5lpy%is$é®¤‚\ĞPV\\1À;°¬¢**¢±4x¡\"\Ö\Ğ\×\Â\ÑH\ã\Ç\Õõ80¬f¡Š.L¥·\Ê4†`8Àˆc¡¼‹\Ã{/÷p{şa\ä\í{7ºfHÿ\ÚÈˆZŒ\ï\ïHŸ\ã\0¦\Ò\ÃI¡#†h1|ğ`\Ò\æ1\ÓşC\r•ı†”\çTT)‡!5±\ê*—Cª\Çõµpõt·O\Ó\ãÀp(\r\é\ÂTA\êA˜eƒ§!\Z`\"Œ#/\Ç\â\È\Ş\Ë=Lÿ#w8{ó¾wMÃ‡—\Z\Ğç†¢\ïu\ïd\à\ßjQ\r#I¡\r#\'DFN\Úl\"İ•\r\'48¼:wÈ\á\Õ0ü\ÈÊ¡CaJ.:¥¯…£‘ÿ…F$\nendstream\nendobj\n34 0 obj\n<</Filter/FlateDecode/Length 413>>stream\nxœ]“\Ëjƒ@†÷>\Å,\ÓEp.¹	A\ĞI„,z¡iÀ\èI*\ÔQ&f‘·\ïx~›B…\ï\Ü\çŸcl»ƒk¿ù®:\Ò Î«=]»›¯Hœ\èÒ¸HiQ7\Õ0«¶\ì£8$\ï×Úƒ;w\Ñv+Dü¼\×Á\ß\Å,«»=Eñ«¯\É7\î\"fŸöøx\ëûoj\É\rBFi*j:‡J\ÏeÿR¶$bN›\ê\ào†û<\äüE|\Ü{šYašª«\éÚ—ù\Ò](\Ú\Êğ¤b[„\'\È\ÕÿüzJ;«¯\Òs¸	\áRj™2\íA9“R =‘‘j2 (Ii;’\ÉV ö™\\1\Íd\á+$\Óf2 Z3%\È+P3Y¤%òJ\Ğoòå „I-\Ğİ€ö ‚I+Ì²M“¡\Ê&I–q\ÒK=\äû•[i®¨t\Â’\ÇSfªopR(œ ²\ØÁˆô3\ãN´\\Âˆa\å\nF¨’\á<¸/‹2\äPK¡X¾‚‘;h\r\á¬Â‘0¢‘Ew½†¢Z;	€+5®şc_«›÷aUùÿ\à·³qôø…ú®³\Æ÷¶\ÍŞ¤\nendstream\nendobj\n143 0 obj\n<</Length 3441/Subtype/XML/Type/Metadata>>stream\n<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?>\n<x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 5.1.0-jc003\">\n  <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">\n    <rdf:Description rdf:about=\"\"\n        xmlns:pdf=\"http://ns.adobe.com/pdf/1.3/\"\n        xmlns:xmp=\"http://ns.adobe.com/xap/1.0/\"\n        xmlns:dc=\"http://purl.org/dc/elements/1.1/\"\n        xmlns:xmpMM=\"http://ns.adobe.com/xap/1.0/mm/\"\n      pdf:Keywords=\"DAF5te4OoIE,BAF2ZGlca9o\"\n      pdf:Producer=\"DocFly; modified using iTextÂ® Core 8.0.2 (AGPL version) Â©2000-2023 Apryse Group NV\"\n      xmp:CreateDate=\"2024-01-14T11:41:19Z\"\n      xmp:CreatorTool=\"Canva\"\n      xmp:MetadataDate=\"2024-01-14T16:47:19Z\"\n      xmp:ModifyDate=\"2026-07-23T22:06:54+03:00\"\n      xmpMM:DocumentID=\"uuid:7180aba3-61ce-3053-952d-3617982ce0ce\"\n      xmpMM:VersionID=\"1\"\n      xmpMM:RenditionClass=\"default\">\n      <dc:creator>\n        <rdf:Seq>\n          <rdf:li xml:lang=\"x-default\">Â§ Ã Â® Ãƒ Ã„ Â¿ Ã‚  </rdf:li>\n          <rdf:li>Â§ Ã Â® Ãƒ Ã„ Â¿ Ã‚</rdf:li>\n        </rdf:Seq>\n      </dc:creator>\n      <dc:title>\n        <rdf:Alt>\n          <rdf:li xml:lang=\"x-default\">Â‘ Â™ Â¤ Â— Â£ Â— </rdf:li>\n        </rdf:Alt>\n      </dc:title>\n      <dc:subject>\n        <rdf:Bag>\n          <rdf:li>DAF5te4OoIE</rdf:li>\n          <rdf:li>BAF2ZGlca9o</rdf:li>\n        </rdf:Bag>\n      </dc:subject>\n    </rdf:Description>\n  </rdf:RDF>\n</x:xmpmeta>\n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                                    \n                                                                                \n<?xpacket end=\"w\"?>\nendstream\nendobj\n145 0 obj\n<</BBox[0 0 114.67 25]/Filter/FlateDecode/Length 96/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbCC=3s#S…¢T®p °>Š§.}7CC3…4.=s=SK….=3.J\ç\Ò04\Ñ\É\âr\r\á\nBW 	0\Z\0\İ\Ï\nendstream\nendobj\n146 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 97/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›¡‚‘‰BH\Z—±©‘¥‚©!—\Âe g¦\0\ÃE\é\\\Z†¦@ g°@3$‹\Ë5„+]Áh\0K\Ó\í\nendstream\nendobj\n147 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 99/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‰©¥¹‚™%—\Âe g¦\0\ÃE\é\\\ZFÆº\æºFFfš!Y\\®!\\@\è\n4	F\0`¼\Ï\nendstream\nendobj\n148 0 obj\n<</BBox[0 0 142 25]/Filter/FlateDecode/Length 96/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC##S…¢T®p ˜>Š¼S—¾›¡‚¡…BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Zf–\æf¦&\ÆF†š!Y\\®!\\@\è\n4F\0û\nendstream\nendobj\n149 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 93/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Z\ÎAÁ!şÁš!Y\\®!\\@\è\n4F\0\ày\nendstream\nendobj\n150 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 96/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\ZşÁ!ş>.Áš!Y\\®!\\@\è\n4F\03\×\ZU\nendstream\nendobj\n151 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 101/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Zş¾Aş¡\n–:\n!aAşÁš!Y\\®!\\@\è\n4F\0¹Qi\nendstream\nendobj\n152 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 94/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Z†F\Æ&¦f\æ–š!Y\\®!\\@\è\n4F\0\ã¢\ç\nendstream\nendobj\n153 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 90/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Z†F\Æ&¦š!Y\\®!\\@\è\n4\0F\0€^	\nendstream\nendobj\n154 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 91/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Z†F\Æ&zš!Y\\®!\\@\è\n4F\0—z2\nendstream\nendobj\n155 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 88/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Z¦zš!Y\\®!\\@\è\n\Ô£g«\Í\nendstream\nendobj\n156 0 obj\n<</BBox[0 0 184 25]/Filter/FlateDecode/Length 91/Resources<</Font<</F1 4 0 R>>>>/Subtype/Form/Type/XObject>>stream\nxœ\Ó©Ppòu\æ*\ä\ÊbC#S…¢T®p ˜>Š¼S—¾›!P‰BH\Z—‘‚™%•\Âe g¦\0\ÃE\é\\\Z†F\Æ&zš!Y\\®!\\@\è\n4F\0—z2\nendstream\nendobj\n144 0 obj\n<</Filter/FlateDecode/First 871/Length 3183/N 105/Type/ObjStm>>stream\nxœZks\Û6ı+ø\ÏND\0\Äs&\Ó\ÇqZO\î\Ä\Îv» %X\á–½•÷\×\ïÁƒ¤hn\í’i\âu/\î=÷\\\0\Å%2\'‚\æDr\"4\'’¡5´[…¿D\á¯4DsC¤&Ú ¦ˆÁh)‰eı\ÄjC” Œ\nMTN£¨s<5#Š\ÆsA4\ÅÓ¢\ß–+E”!Lp\Ô5–-	“0EC\âœh\èQu\è\Ñ3B\ŞPK4\ä\r\æ\Ãÿ\Ì\æ¨k\Â)\å°O\Øb\áóA”3‹:\'œ\Ã~LÁs\Î\ì\ç9*\Æ.à¬¼d‚`(—Pf!¯0Ÿ…¼¦¨C^{\ã) c¡À/68Or\np•(X\æa 9óşcT\ÉQ\à(`R Cò\\z¨,\ÉE\è2(/=\0Ls\Å\0¬Ê•\ïbĞ£a+c\Ğc˜’\Ğc<$zl\è2ˆ\"$\0:\n%hL@!Dp\ß\Åi8ƒb\é	J„ ^¡E!tA>XĞ£\à“@B\Ô:\Ô!Æˆ—B#¾]‚,9\n<\"†HÀ¡^r\0.@(¨\ä\Z\Ä0L\à)‰0a^DP<óŒ±@\n\nµFL\Ñe(epO))\"è¡5hW¨£¬÷À8kCºu\ë	\ë\ëˆuˆX 7\np\Ñ\Ğ\äÁô@P\Æ<š¾-€\ÇB›g\'÷mœzŒ|XüB&eyˆ7\"\Îr\Õ¡b\È”\0Ü›7\Ù\ÛÊ¹\Õ\Ûú\Ç\r¨¾0\Üz¬\\ÀBIˆ—U·\ÙY½mÜ¶\Ù\ß 3˜_@ˆğ`ÀO\Ø\Õ/\èø\äVeñÂ˜_‹¦	–Bmö\Å\í\ë\Ãn\éö0ó—wÿr\Ë¥÷x%\â”\"*¾G·8\ncÅ—m*\n¬\"±òI–\Ê>\Ñy*HP>–¢\Z\Ë\Æ/©˜eœùú\ã\Ùù\ã\ã\İ\ÕÏ—HE\ßòşd\×\Å\İ>»Ê®w\å\æ¿¯œ_»Ÿ~ò!¹x÷j[¯\Å\ì=\É>\ÜD€I&^eŸ\ë\íU³;,›(\Ë\ç•\Ûü?%\"(\É;%,)ùõ¯\çA˜w\Â4	¿+¿ÿq\ÄY+\âğW\ÅYW´›\İ\ÌğŸ±`ƒ\í”\è	ş3\Z„M\'¬¦ùoƒ¸\î\Ä\å4q\Ä\Õ\\ø\Â\ìªWb|&(‘’|\n|:wV|šÁ\ÕQW±iâ¼ŠÏ„O\âè¼\ÊÎ€O\é\Â\ÊL€/ì¨«ô$ò:3\×ÿ°ú\è>z}DX}tG=…>\"Pwô\Ñ\Ó\è#\Âò¡ó¹şôM=+ş!¦‹¿\ÒGwñ\×\Ó\â/Bú\è¹ñ—}\Ó\Å\ßÌ‰¿10]üÍ”øË¦‹¿™r\ÏÌ¿\è\Û.şfNüeˆ\í\âo¦\Ä_†4]üÍ´øË{fnüU@\ßvñ·s\â¯Bl;)ş!m;1ş!÷\ì\Üø\ë\0ŸßŠ·\Ó\Ï!€Î£–v\ntH\Û1ÀNc€!œ\Ë\0m¢\íü1r:ª‘½š),\Ğ*Š‹^|\Z´Œ\n\æÁ„ øóWgÀ&\Õ\Ğ^\Í*\Z½°½øD2Ø¨`.LŒ\ë\ÙÀ\æ°Á\Äh°\rl\nL\ÌJÖ³Mcƒ‰	\É\æ²ÁFx\Ï6‡\r6\ÂÀ{6°)l°	†\rl\Zl‚a&x<úk‡\Ö\0>ƒ\r<ı½P§f89\Å{6ğIl\à4fŸ\ÉˆşÎ¥3`x<(ú«¯N\Í6p\ZjŞ³Ob§q‰\æ3\Ù@m0 \Ş¤Sn:­¥CKÚ»§-l\ÚÉ¥\rMz¯§—[»¼·\ë[›\à-\Ã\Û·>k\Í4kƒ·¢CKL‹\Æ@ôXMº 1óEoü¤K\Z3_ô—bšx\È[\Ñ\å›È§‰‡|]¾‰I\éFm\ÈW\ÑgÛ¤=5!MD:\Ñ,¶\ëWn{=yÁzyØ¸\íŸ\æ\Üõ\Î9\ëG7¤¾/CK÷C}\Óg÷£ù\à	Ë¾Ô•ûT<¼y\ãoøzı~Ğ—ºn\âo‹½{_Ã‚_\\õ\İ5\å²\ÈÎ·\ËzUn\×$Fús±q¡7»:\Ü5^WÆ¢J/\Z½+\ï\ïŒXºı\r¸\ìn\ç¾;’-‹]½Å£\ÜÁ\Óû\Êı ÙªnŠ\å\Ò_Ÿf\ß\Ûu±;lª\â€Z½®·\î’\íü\äYSV+\ço­³\ê\Æ\í\ÑX9éœ­wTûô\Ï\îU\å º*\Ök·kŸ«»Šd®ªÊ‡}¹Gi³*ö\ßğ\Ü\Æ\ç}Uc\n<wÅ²)½y\ëCY…	*w\ßUw\åú\ê›r{€·k¾Õ‡}±]%£0\Ñ\0\ìkQ¾­%ñP=\ê9n\ÓDÍ®X¹M±÷¥·’d÷U°øòœdW	\Ê\ßW%pı35\Ñ\Ê\í÷ª’@\r}û\Ôû\ßø\Ä\á†d\ç‡]\â³<\ì|´@¥|´\ê?\Üö®\ØùOFP\ØM±¬“½õnu\ï\0E¹øX ³ª^ƒ/Õ¶F\çÿ®\Ü=‚\ç\Ö\å>:`´)–\Ñ>·öd\Íª\Ã>a\Ùü§\Ş\0hY#j\Í7t÷\Õbyh0zs \Øş\Ø\Ëz\å	µ.İª¬ªm„`İ¦\Ø/U0\ÇH\ßı\ïC±k</PşVT÷iªÔ¼\'kyv\Zù”¦yO\Éz\Zi˜öœF~\"&g-\çI\ÉyRr~¬\ä¼¾H\ã.Ò¸‹\ãqı¸óQüœ&¿LB—I\èòX\è²\ÔoUS>ThL|øš4|M\Z¾kø\ÚKşú¯¿\Õ;Ÿn·\Û\ï*tIE‘†\Ç*ŠdDÑ«*\"L…_:˜\\R\â’w¬\Äõ\Âe\ZW¦q\åñ¸²\ç<L\Û4y„\ê$T\Õ\í ^xU~/CS\é\äIşp,\è\åSAzl{\Ò\ç‘vıL\ì\'l­€b•:4?_5E\ã°2öd\r>\rş‚m\ê\×o\ëj•½sû¥_¶¶°¿iwn\í ò¢l_ÿ2Xiv]İ–„%4¾rŸ¬\×\ÏLzvñ\î\ê9¼¹\Ø\Ş\×z¹[9\ÌW\íd\'Ù—\å»\ÇW§«úÎ`\î‡¼·ü¢Nñº†\ëú\ç‹wxıtf\ï~#Z\Ò`‚wkW>4H\ÜôNk‡¤\à\å½\É\Ùo79¹\áZ/L½ü-Á\êFš|a¯GJºN”¥T&ypü¨vë¿•\Ş\äy¾ TvKrJÉ\áta|¶€b¡…Â™UQµBm¡\Å-˜D± \ÆO „Zp\ã¿\àj&y´H\à\Ítc$ts&6ú¨&ùÿ4\ç¦t\Ø8jfZ¥\Ô\ÂZF}w\ïK\ßÖ4­Q\é³c¥l ı¯\Ü\Ìm¸<\ÕPCZm=B²\Ó~!\í%1>F€\Ëb§Û•‚.d€¢—’R/”\Ú#Y\Å\Ø\Â\à\ÄQ\ëõ(\0¥B«D (N¢\Ğcø\Â–Dj¹P&\ßËŒ€\í\\I5°óÈ¢NªyKN7ZA—··15N÷awb©\\xDvV<ü\â\ÂKP\r\ÎnRf6\ä5‡–	ª²÷U±\Şû\ÖH}-úro\Ş\ë\\ƒRJÀœ›Ä‚Y£ˆ%\ìdùmz_V“<}\ÏEC\Ø|3ô¢)ªry\ZvDû:·ù;ş¯>kú,‹~}(WXA\Â9\Âÿ\nÀ/$±\ãc¹)±¸·®dxü¾\rÁÑ ¸%&\ÃMs\Úg“\áN<m\Ş\Ép{ŸNdxfH\Ç2<ˆ¤³nÒˆL\é”E†Ç¾tR<ö\rgúô¡x\Ğ\n\Ë\äS\ßü\×\éôY{\Ğ\n\Ë\äS\ßü\ç\Ğöl9üÆš>\Ë·\â\\¾ôZ¤|\ê…ÿ\ÌL\ä\È{\Õ\È^\Ô\È^t\Ô\È^t\Ô\ÓXø¯²D¼\ÈıØ‘½¹;²WÀ75²WÀ7=B]À7=²WÀ7=²W zd¯@,ô\È^ô\È^ô\Ø^ø¦\Çö\Â73²W\Â73²W\Â73²W\Â73²W\Â73²W\Â73²W\Â73²W\Â73²W\Â7;¶¾Ù±½ğÍ\ìUğÍ\ìUğÍ\ìÕ¾ud¯†\Çvd¯†\Çvd¯†\Ç\é³Ã Yt7,\ÃKööZ~Ğ¬O\ÚKÿA³9!\é>\ĞlOº[›\á\Íu{\×=hf\'\íMú >¦KòAs~\Ò\İ\r¯ƒ\Û\äA³÷’\ì6\ŞK6²\Û\İú¹õ\Û_¸‰ø{¿ñú¥+Õş`\Í\ÈS¿Ò¦\àc\Õ\Ô\ÃÅŸz\ê¯:\Û\Ë\ÑA³‡‹?õ\Ô_Ï’t«:höñ\äO#\ä\ï\Û\ÇA³\'j·÷´W•®O\Ød\âµù\ë:ı*¾1?}9\êf\Ïwó\ç»ó\ç»\Åó\İòùnõ|·~¾\Û<\ßm_€\å%\Ø^À½\0{9öt\ìO°»I¿ÿó\Ï\êƒÿ\é^\Ü¥óT÷»¶}Töù°\Ù\ßxºü»y¥³\nendstream\nendobj\n158 0 obj\n<</Filter/FlateDecode/ID [<2524d70e660b9740ee21063e26a7f398><b785eba1dce5b75cc5c37172ffa39eaf4dd14ca97f98b86b83c65d8bb03910b53e7cd090792e8bf9cfa7e3037181c0b76ba54cb35b152bd15c83cea1c1223174>]/Index[0 159]/Info 137 0 R/Length 347/Root 136 0 R/Size 159/Type/XRef/W[1 2 2]>>stream\nxœ%Ò¹2P\ÆñsK$ˆ‰]Ä¾\ïû±\ï	²ˆ}zµ‚…B§ö\0J½\Ê\Ğy­ó—;w~3\çÜ™;g\æ;\"\Ñû$z¬bD²\ÄP.ÃŠH6=\ä€yN(\0B¸Á\ÅP^(ø! \ÆXoÒ³¬\Â\Z¬Ã†±¿Š˜Ğ—\")&½M¹ˆ\Â&,\Â\Ì\Ã\Ì\Â„a\ZBV°Àÿ§[6È†,È„mÈ‡<\È\Ø!…\à‚pBŠÁn(‚ø ¼PI¨€r(?\ì@\rTCTB\n‚P¨…]h‚Fh€zØƒ6h…h†}\è‚N\è€v8€>\è…\è†C‚A€~8‚1…†c˜‚I˜€q8S‘;\Ö\â>Ê™±|kú\æ™ôxxZòÁZ8•ğ»²û¢D®•è…²W¶•\í!%T\â%a‡_%ù£\ì|*©·ôş›\Ë+‘?+•f\ß\nendstream\nendobj\n%iText-Core-8.0.2\nstartxref\n27500\n%%EOF\n','application14.pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_CITIZEN'),(2,'ROLE_MANAGER'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `average_production` float(6,2) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `damage_percentage` float(5,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `field_area` int DEFAULT NULL,
  `price_per_unit` double(7,2) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `compensation_id` bigint DEFAULT NULL,
  `farmer_id` bigint DEFAULT NULL,
  `file_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_54nocvb1ctt3xdihwgq26b5ot` (`compensation_id`),
  UNIQUE KEY `UK_9qs0c5pybqfwv0sigqjq3kfbr` (`file_id`),
  KEY `FKgxkiopsf4wovlnxelvirqo2c9` (`farmer_id`),
  CONSTRAINT `FK4gnvuwj6baefqx47ryci8riue` FOREIGN KEY (`compensation_id`) REFERENCES `damages` (`id`),
  CONSTRAINT `FKaxo95ukp43l6idoqwsqvl7lx2` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`),
  CONSTRAINT `FKgxkiopsf4wovlnxelvirqo2c9` FOREIGN KEY (`farmer_id`) REFERENCES `farmer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES (14,1234.00,'2026-07-23',50.00,'Test description',12345,1234.00,'ACCEPTED',7,3,7),(15,1111.00,'2026-07-23',0.00,'Test description\n\n',11111,NULL,'CREATED',NULL,3,NULL);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'admin@hua.gr','$2a$10$GILEnyU8e98K4j4mFsKA/.eOh4ASw.nnTo7LmZ0zqjlTSvOqBIMna','Admin'),(6,'it2021010@hua.gr','$2a$10$kG5ACD.7IcHInINVQOv4aO7W5PHwPh9QetYxFgVSXCyJ1w8iTNt5e','tolisapo'),(7,'manager-example@gmail.com','$2a$10$zZRiuGXXmnCq4LJlHuuIM.96O0gchXJjgs8rMJ/tw.IcKilEt1lj.','manager');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (6,1),(7,2),(3,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-26  0:09:53
