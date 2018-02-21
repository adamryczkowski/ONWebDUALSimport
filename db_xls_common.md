% Adam  Ryczkowski
% df1
% Tue Feb 20 19:37:40 2018




# Changes to data when transforming _df1_ into _df2_

All questions names are matched between the databases. 
All patients are matched between the databases. 
There are 12 366 changes to the values to the existing patients and existing questions between the databases, which is 103% of all non-missing values. 


## Changes to the patient `ANTA-0002`

* cannot convert value ``No`` to number in 62 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 43 questions: _How many family members 1 had a history of ALS_ (`q_100a_2`), _How many family members 2 had a history of ALS_ (`q_100b_2`), _How many family members 3 had a history of ALS_ (`q_100c_2`), _How many family members 1 had a history of FTD_ (`q_101a_2`), _How many family members 2 had a history of FTD_ (`q_101b_2`), _How many family members 3 had a history of FTD_ (`q_101c_2`), _How many family members 1 had a history of Alzheimer disease_ (`q_102a_2`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 18 questions: `q_110d`, `q_111`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 16 questions: `q_149d`, `q_149h`, `q_152h`, `q_156h`, `q_16b`, `q_24c`, `q_25d`, ...`q_28b`, `q_28c`, `q_29a` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_24`, `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``NA`` removed in _Creatinine level  (or NF, NA, NR)_ (`q_55a`), _Creatinine lower range_ (`q_55b`) and _Creatinine upper range_ (`q_55c`) 
* ``Normal`` replaces value ``Abnormal`` in `q_60`, `q_61` and `q_62` 
* ``Niece maternal`` added in _Which family member 1 had a history of ALS_ (`q_100a_1`), _Which family member 1 had a history of FTD_ (`q_101a_1`) and _Which family member 1 had a history of Alzheimer disease_ (`q_102a_1`) 
* ``Niece paternal`` added in _Which family member 2 had a history of ALS_ (`q_100b_1`), _Which family member 2 had a history of FTD_ (`q_101b_1`) and _Which family member 2 had a history of Alzheimer disease_ (`q_102b_1`) 
* ``Niece unknown line`` added in _Which family member 3 had a history of ALS_ (`q_100c_1`), _Which family member 3 had a history of FTD_ (`q_101c_1`) and _Which family member 3 had a history of Alzheimer disease_ (`q_102c_1`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `2` added in _Number of children_ (`q_110a`) and _Order of specialist 2 that observed the patient_ (`q_154a_2`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``General Practitioner`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* factor variable `q_16g` doesn't have defined level ``No`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* ``Distal and proximal`` replaces value ``Proximal`` in _Predominant impairment_ (`q_18c`) 
* ``1 Oro-facial`` added in _1st region_ (`q_48a_r`) 
* ``2b Right Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``3b Left Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``2a Right Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``3a Left Upper limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``4b Right Lower limb – proximal`` added in _6th region_ (`q_48f_r`) 
* ``2017-11-14`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Speech combined with nonvocal communication`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Moderately excessive saliva; may have minimal drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Dietary consistency changes`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``Intermittent use of BiPAP`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``Myocardial infarction`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `90` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `5` added in _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s number of siblings_ (`q_108b`) 
* `"housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0011`

* cannot convert value ``No`` to number in 65 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _Mother´s birth order_ (`q_107a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 15 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_135`, `q_136`, `q_138` 
* cannot convert value ``Yes`` to number in 13 questions: `q_149a`, `q_152d`, `q_152e`, `q_152f`, `q_152h`, `q_156h`, `q_16a`, ...`q_28a`, `q_28b`, `q_28c` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_137`, `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`) and _5th timing_ (`q_48e_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* ``No`` replaces value ``Yes`` in `q_19` and `q_63` 
* ``NA`` removed in _Total Cholesterol lower range_ (`q_56b`) and _Triglycerides lower range_ (`q_59b`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) and _What cause of death of family member 2_ (`q_106_2b`) 
* `"unknown"` added in _What other cause of death of family member 1_ (`q_106_1c`) and _What other cause of death of family member 2_ (`q_106_2c`) 
* `4` added in _Father´s number of siblings_ (`q_108b`) and _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``4b Right Lower limb – proximal`` added in _1st region_ (`q_48a_r`) 
* ``5b Left Lower limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``4a Right Lower limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``5a Left Lower limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``1 Oro-facial`` added in _5th region_ (`q_48e_r`) 
* ``Bulbar`` replaces value ``Cervical`` in _Region2_ (`q_49b`) 
* ``Bulbar`` removed in _Region3_ (`q_50a`) 
* ``2017-12-05`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Not all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Can cut most foods, although clumsy and slow; some help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can turn alone or adjust sheets, but with great difficulty`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Nonambulatory functional movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``Type II`` replaces value ``Type I`` in `q_74` 
* ``Yes`` replaces value ``No`` in `q_91a` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``A`` added in _Abnormal C9orf72 repeat-expansion_ (`q_98_1`) 
* ``Mutation found`` added in _TBK1 mutation_ (`q_98_2a`) 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* `83` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* ``Son`` added in _Which family member 2 had died_ (`q_106_2a`) 
* `56` added in _Age of family member 2 at the moment of death_ (`q_106_2d`) 
* `9` added in _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s birth order_ (`q_108a`) 
* `"housewife"` removed in _Main Ocupation_ (`q_139`) 
* ``General Practitioner`` added in _First specialist who observed the patient_ (`q_148`) 
* cannot convert value ``NA`` to integer in _Time gap between first-second specialist_ (`q_151`) 
* ``Cardiologist`` added in _What specialist 1 observed the patient_ (`q_154b_1`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0015`

* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 57 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118c`, `q_119a`, `q_119b`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `1` added in 31 questions: _How many family members 1 had a history of ALS_ (`q_100a_2`), _How many family members 1 had a history of Parkinson disease_ (`q_103a_2`), _Mother´s birth order_ (`q_107a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* cannot convert value ``Yes`` to number in 21 questions: `q_118b`, `q_152d`, `q_152e`, `q_152f`, `q_152h`, `q_156h`, `q_16a`, ...`q_28c`, `q_29a`, `q_29b` 
* ``No`` removed in 18 questions: `q_123`, `q_124`, `q_125`, `q_127`, `q_128`, `q_129`, `q_130`, ...`q_145`, `q_146`, `q_147` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Siblings' birth order_ (`q_110a1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* factor variable `q_24`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`) and _5th timing_ (`q_48e_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* factor variable `q_16g` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``Country towns– 1000-5 000`` removed in _Place of living_ (`q_143`) and _Place of living_ (`q_144`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``NA`` removed in _Time gap between first-second specialist_ (`q_151`) and _Time gap between first medical observation and diagnosis_ (`q_155`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``4a Right Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``2a Right Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``5a Left Lower limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``3a Left Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``1 Oro-facial`` added in _5th region_ (`q_48e_r`) 
* ``2017-12-20`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Loss of useful speech`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Dietary consistency changes`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Mutation found`` removed in `q_97a` 
* `"SNP"` removed in _SOD1 mutation type_ (`q_97b`) 
* ``Sister`` added in _Which family member 1 had a history of ALS_ (`q_100a_1`) 
* ``Uncle maternal`` added in _Which family member 1 had a history of Parkinson disease_ (`q_103a_1`) 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"UNKNOWN"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `60` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `6` added in _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s birth order_ (`q_108a`) 
* `7` added in _Father´s number of siblings_ (`q_108b`) 
* `9` added in _Number of siblings_ (`q_110a2`) 
* `"officer"` removed in _Main Ocupation_ (`q_139`) 
* `"farmer"` removed in _Second Occupation_ (`q_141`) 
* ``Rehabilitation specialist`` added in _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Neurologist`` added in _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0016`

* cannot convert value ``No`` to number in 71 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Mother´s birth order_ (`q_107a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 19 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in `q_149a`, `q_156h`, `q_16a`, `q_26a`, `q_27a`, `q_28a` and `q_28b` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`), _7th timing_ (`q_48g_t`) and _8th timing_ (`q_48h_t`) 
* `2` added in _Number of children_ (`q_110a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Internal Medicine`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``2a Right Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``3b Left Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``2b Right Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``7 Neck`` added in _5th region_ (`q_48e_r`) 
* ``5b Left Lower limb – proximal`` added in _6th region_ (`q_48f_r`) 
* ``4b Right Lower limb – proximal`` added in _7th region_ (`q_48g_r`) 
* ``1 Oro-facial`` added in _8th region_ (`q_48h_r`) 
* ``2018-01-11`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Detectable speech disturbances`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can turn alone or adjust sheets, but with great difficulty`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Mild unsteadiness or fatigue`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"SVA"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `70` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `7` added in _Mother´s number of siblings_ (`q_107b`) 
* `4` added in _Father´s birth order_ (`q_108a`) 
* `12` added in _Father´s number of siblings_ (`q_108b`) 
* `5` added in _Number of siblings_ (`q_110a2`) 
* `"farmer"` removed in _Main Ocupation_ (`q_139`) 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0017`

* cannot convert value ``No`` to number in 65 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 28 questions: _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 13 questions: `q_149b`, `q_152d`, `q_152e`, `q_152h`, `q_156h`, `q_16a`, `q_16c`, ...`q_28a`, `q_29a`, `q_29b` 
* `2` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`) and _8th timing_ (`q_48h_t`) 
* factor variable `q_26`, `q_28`, `q_30a`, `q_87a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) and _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``2a Right Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``2b Right Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``3b Left Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``3a Left Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``5a Left Lower limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``4a Right Lower limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``6 Respiratory symptoms`` added in _7th region_ (`q_48g_r`) 
* ``Same time`` added in _7th timing_ (`q_48g_t`) 
* ``1 Oro-facial`` added in _8th region_ (`q_48h_r`) 
* ``Thoracic`` replaces value ``Bulbar`` in _Region3_ (`q_50a`) 
* ``2018-01-11`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Early eating problems - occasional choking`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Needs attendant for self-care`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can initiate, but not turn or adjust sheets alone`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs when walking`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* `1976` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Mutation found`` removed in `q_97a` 
* `"SNP"` removed in _SOD1 mutation type_ (`q_97b`) 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"CVA"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `86` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `4` added in _Mother´s number of siblings_ (`q_107b`) 
* `6` added in _Number of siblings_ (`q_110a2`) 
* `"shepherd"` removed in _Main Ocupation_ (`q_139`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_144a`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0018`

* cannot convert value ``No`` to number in 65 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 28 questions: _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 14 questions: `q_124`, `q_125`, `q_126`, `q_127`, `q_129`, `q_130`, `q_131`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 13 questions: `q_149g`, `q_152e`, `q_152g`, `q_152h`, `q_156d`, `q_156h`, `q_16a`, ...`q_29a`, `q_29b`, `q_29c` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`) and _7th timing_ (`q_48g_t`) 
* factor variable `q_123`, `q_128`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g`, `q_24` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) and _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` removed in _LDL Cholesterol lower range_ (`q_58b`) and _Triglycerides lower range_ (`q_59b`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) and _What cause of death of family member 2_ (`q_106_2b`) 
* `"Unknown"` added in _What other cause of death of family member 1_ (`q_106_1c`) and _What other cause of death of family member 2_ (`q_106_2c`) 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s number of siblings_ (`q_108b`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* `"ANTC0009"` added in _Control subject code_ (`q_3b`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``4a Right Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``4b Right Lower limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``5a Left Lower limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``5b Left Lower limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``2a Right Upper limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``3a Left Upper limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``1 Oro-facial`` added in _7th region_ (`q_48g_r`) 
* ``2018-01-11`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Significant difficulty, considering using mechanical respiratory support`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``Type II`` replaces value ``Type I`` in `q_74` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Mutation found`` removed in `q_97a` 
* `"SNP"` removed in _SOD1 mutation type_ (`q_97b`) 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* `58` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* ``Son`` added in _Which family member 2 had died_ (`q_106_2a`) 
* `53` added in _Age of family member 2 at the moment of death_ (`q_106_2d`) 
* `5` added in _Number of children_ (`q_110a`) 
* `6` added in _Siblings' birth order_ (`q_110a1`) 
* `9` added in _Number of siblings_ (`q_110a2`) 
* `"farmer"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0022`

* cannot convert value ``No`` to number in 71 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Mother´s birth order_ (`q_107a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 13 questions: `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, `q_130`, ...`q_135`, `q_136`, `q_138` 
* cannot convert value ``Yes`` to number in `q_121a`, `q_121b`, `q_16b`, `q_24a`, `q_24c`, `q_25a` and `q_26a` 
* factor variable `q_123`, `q_132`, `q_137`, `q_24`, `q_26`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Mother´s number of siblings_ (`q_107b`), _Father´s birth order_ (`q_108a`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_16g` and `q_28` doesn't have defined level ``No`` 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``General Practitioner`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``1 Oro-facial`` added in _1st region_ (`q_48a_r`) 
* ``3a Left Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``3b Left Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``5a Left Lower limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``2a Right Upper limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``4a Right Lower limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``2016-03-11`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Detectable speech disturbances`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Slight but definite excess of saliva in mouth; may have nightime drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Dietary consistency changes`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Significant difficulty, considering using mechanical respiratory support`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Needs extra pillows in order to sleep (>2)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``Intermittent use of BiPAP`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* `2005` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``Yes`` replaces value ``No`` in `q_89a` 
* `"Lithium"` added in _Drug(s) used in psychiatric medication_ (`q_89b`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* `"Gabapentine"` replaces value `"gabapentine"` in _Antiepileptc's name_ (`q_92b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Son`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"Unknown"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `60` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `9` added in _Father´s number of siblings_ (`q_108b`) 
* `7` added in _Siblings' birth order_ (`q_110a1`) 
* `8` added in _Number of siblings_ (`q_110a2`) 
* ``Head`` added in _Head/Neck trauma > 5 years_ (`q_116`) 
* `"tourism"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `JENA0044`

* cannot convert value ``No`` to number in 62 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 31 questions: _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* cannot convert value ``Yes`` to number in 16 questions: `q_122b`, `q_156a`, `q_156b`, `q_156c`, `q_156d`, `q_156e`, `q_156f`, ...`q_27a`, `q_28c`, `q_29a` 
* `2` added in _Number of siblings_ (`q_110a2`), _How long vigorous sport activity 1_ (`q_112b_1c`), _How long vigorous sport activity 2_ (`q_112b_2c`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``mmol/l`` added in _Total Cholesterol unit_ (`q_56d`), _HDL Cholesterol unit_ (`q_57d`), _LDL Cholesterol unit_ (`q_58d`) and _Triglycerides unit_ (`q_59d`) 
* ``No`` removed in `q_110d`, `q_145`, `q_146` and `q_147` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 2 observed the patient_ (`q_154b_2`) and _What specialist 3 observed the patient_ (`q_154b_3`) 
* ``Same time`` added in _2nd timing_ (`q_48b_t`), _4th timing_ (`q_48d_t`) and _6th timing_ (`q_48f_t`) 
* ``After`` added in _3rd timing_ (`q_48c_t`), _5th timing_ (`q_48e_t`) and _7th timing_ (`q_48g_t`) 
* `"No"` removed in _Second Occupation_ (`q_141`), _Second Occupation_ (`q_142`) and _Side effects of Riluzole_ (`q_91c`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Number of children_ (`q_110a`) and _Order of specialist 3 that observed the patient_ (`q_154a_3`) 
* `"heating engineer"` removed in _Main Ocupation_ (`q_139`) and _Main Ocupation_ (`q_140`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Orthopaedist`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Jena`` added in _Medical facility_ (`facility_id`) 
* ``B Stubbendorf`` added in _Physician recording the data_ (`person_id`) 
* ``Not related`` added in `q_3a` 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* factor variable `q_16g` doesn't have defined level ``No`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Upper Limbs`` replaces value ``No`` in _Sensory changes_ (`q_39`) 
* ``Positive`` added in `q_43` 
* ``4a Right Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``5a Left Lower limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``4b Right Lower limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``5b Left Lower limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``2a Right Upper limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``3a Left Upper limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``1 Oro-facial`` added in _7th region_ (`q_48g_r`) 
* ``2017-05-04`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Detectable speech disturbances`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Can cut most foods, although clumsy and slow; some help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``µmol/l·s`` added in _CK unit_ (`q_53d`) 
* ``g/l`` added in _Albumin unit_ (`q_54d`) 
* ``µmol/l`` added in _Creatinine unit_ (`q_55d`) 
* `"Budesonid"` replaces value `"Budesonid Spray"` in _Steroid's name_ (`q_95b`) 
* ``Wt/wt (normal)`` added in `q_97a` 
* ``A`` added in _Abnormal C9orf72 repeat-expansion_ (`q_98_1`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* ``No`` replaces value ``Yes`` in `q_111` 
* ``Cycling`` added in _Type of vigorous sport activity 1_ (`q_112b_1a`) 
* ``Football`` added in _Type of vigorous sport activity 2_ (`q_112b_2a`) 
* cannot convert value ``NA`` to integer in _Time gap between first-second specialist_ (`q_151`) 
* ``Yes`` added in _Did specialist 3 made diagnosis_ (`q_154d_3`) 
* `"JENA"` removed in `centr_id` 
* `105` replaces value `286` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0001`

* cannot convert value ``No`` to number in 68 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 39 questions: _Mother´s birth order_ (`q_107a`), _Mother´s number of siblings_ (`q_107b`), _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Number of children_ (`q_110a`), _Siblings' birth order_ (`q_110a1`), _Number of siblings_ (`q_110a2`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``NA`` removed in 26 questions: _Time gap between first-second specialist_ (`q_151`), _CK level  (or NF, NA, NR)_ (`q_53a`), _CK lower range_ (`q_53b`), _CK upper range_ (`q_53c`), _Albumin level  (or NF, NA, NR)_ (`q_54a`), _Albumin lower range_ (`q_54b`), _Albumin upper range_ (`q_54c`), ..._VC (% predicted values)_ (`q_67`), _SNIP – absolute value (cmH2O)_ (`q_70`), _Nocturnal oximetry - mean value (%)_ (`q_71`) 
* ``No`` removed in 20 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in `q_149c`, `q_152e`, `q_152h`, `q_156h`, `q_16a`, `q_26a`, `q_27a`, `q_29a`, `q_29b` and `q_29c` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`) and _5th timing_ (`q_48e_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) and _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* ``Normal`` replaces value ``Abnormal`` in `q_61` and `q_62` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``Large town– > 100 000`` removed in _Place of living_ (`q_143`) and _Place of living_ (`q_144`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Neurologist`` added in _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2015-12-01`` removed in _Date of Invasive ventilation_ (`q_14`) 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``5a Left Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``4a Right Lower limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``2a Right Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``3a Left Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``7 Neck`` added in _5th region_ (`q_48e_r`) 
* ``Lumbo-sacral`` replaces value ``Cervical`` in _Region1_ (`q_49a`) 
* ``Cervical`` replaces value ``Lumbo-sacral`` in _Region2_ (`q_49b`) 
* ``Bulbar`` replaces value ``Thoracic`` in _Region3_ (`q_50a`) 
* ``2017-10-28`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Detectable speech disturbances`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Invasive mechanical ventilation by intubation or tracheostomy`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2013-01-01`` replaces value ``1905-07-05`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `"marketing staff"` removed in _Main Ocupation_ (`q_139`) 
* `"business manger"` removed in _Main Ocupation_ (`q_140`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0003`

* `NA` added in 90 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 67 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* ``No`` removed in 17 questions: `q_111`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 11 questions: `q_152d`, `q_152h`, `q_16a`, `q_26a`, `q_26b`, `q_26c`, `q_27a`, ...`q_28b`, `q_28c`, `q_29a` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`) and _5th timing_ (`q_48e_t`) 
* ``NA`` removed in _Creatinine level  (or NF, NA, NR)_ (`q_55a`), _Creatinine lower range_ (`q_55b`), _Creatinine upper range_ (`q_55c`) and _SNIP – absolute value (cmH2O)_ (`q_70`) 
* `3` added in _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Number of children_ (`q_110a`) and _Siblings' birth order_ (`q_110a1`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* ``Abnormal`` removed in `q_61` and `q_62` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `1` added in _Mother´s birth order_ (`q_107a`) and _Order of specialist 1 that observed the patient_ (`q_154a_1`) 
* `2` added in _Mother´s number of siblings_ (`q_107b`) and _Order of specialist 2 that observed the patient_ (`q_154a_2`) 
* ``Large town– > 100 000`` added in _Place of living_ (`q_143`) and _Place of living_ (`q_144`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Internal Medicine`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``2a Right Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``5a Left Lower limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``4a Right Lower limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``7 Neck`` added in _5th region_ (`q_48e_r`) 
* ``2017-11-14`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Loss of useful speech`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Marked excess of saliva with some drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Needs supplemental tube feeding`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``Normal`` removed in `q_60` 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2007-01-01`` replaces value ``1905-06-29`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `7` added in _Number of siblings_ (`q_110a2`) 
* `"farmer"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0004`

* cannot convert value ``No`` to number in 59 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`), _Mean number of packs/day_ (`q_88e`) 
* cannot convert value ``Yes`` to number in 19 questions: `q_149d`, `q_149e`, `q_149h`, `q_156d`, `q_156e`, `q_156h`, `q_16a`, ...`q_28a`, `q_28b`, `q_28c` 
* ``No`` removed in 18 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_145`, `q_146`, `q_147` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`) and _ALS depression inventory lower range_ (`q_47c`) 
* `2` added in _Number of children_ (`q_110a`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* factor variable `q_133`, `q_24`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``mg/dl`` added in _Creatinine unit_ (`q_55d`), _Total Cholesterol unit_ (`q_56d`), _HDL Cholesterol unit_ (`q_57d`), _LDL Cholesterol unit_ (`q_58d`) and _Triglycerides unit_ (`q_59d`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`) and _4th timing_ (`q_48d_t`) 
* `3` added in _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`) and _Siblings' birth order_ (`q_110a1`) 
* factor variable `q_16g` and `q_30a` doesn't have defined level ``No`` 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Mother´s number of siblings_ (`q_107b`) 
* `"carpenter"` removed in _Main Ocupation_ (`q_139`) and _Second Occupation_ (`q_141`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2017-10-01`` removed in _Date of Death_ (`q_15`) 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``3b Left Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``2b Right Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``4a Right Lower limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``Lumbo-sacral`` removed in _Region3_ (`q_50a`) 
* ``2017-11-22`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Speech combined with nonvocal communication`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Needs supplemental tube feeding`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Nonambulatory functional movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Needs extra pillows in order to sleep (>2)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``U/l`` added in _CK unit_ (`q_53d`) 
* ``g/dl`` added in _Albumin unit_ (`q_54d`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* `2014` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``2016-01-01`` replaces value ``1905-07-08`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `6` added in _Number of siblings_ (`q_110a2`) 
* ``Yes`` removed in `q_111` 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0005`

* cannot convert value ``No`` to number in 73 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 14 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_135`, `q_136`, `q_138` 
* `2` added in _How many family members 1 had a history of Alzheimer disease_ (`q_102a_2`), _Number of siblings_ (`q_110a2`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`) and _7th timing_ (`q_48g_t`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`), _What specialist 2 observed the patient_ (`q_154b_2`) and _What specialist 3 observed the patient_ (`q_154b_3`) 
* cannot convert value ``Yes`` to number in `q_149e`, `q_156h`, `q_16a`, `q_27a` and `q_27b` 
* factor variable `q_16g`, `q_24`, `q_28` and `q_30a` doesn't have defined level ``No`` 
* factor variable `q_133`, `q_137`, `q_26` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`), _HDL Cholesterol level  (or NF, NA, NR)_ (`q_57a`) and _HDL Cholesterol lower range_ (`q_57b`) 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) and _3rd region_ (`q_48c_r`) 
* ``3b Left Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) and _4th region_ (`q_48d_r`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) and _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* `7` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s number of siblings_ (`q_108b`) 
* `3` added in _Father´s birth order_ (`q_108a`) and _Order of specialist 3 that observed the patient_ (`q_154a_3`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``4a Right Lower limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``5a Left Lower limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``6 Respiratory symptoms`` added in _7th region_ (`q_48g_r`) 
* factor variable _Region2_ (`q_49b`) doesn't have defined level ``Thoracic`` 
* ``2017-11-22`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* ``U/l`` added in _CK unit_ (`q_53d`) 
* ``NA`` removed in _LDL Cholesterol lower range_ (`q_58b`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* `1999` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* `2015` replaces value ``NA`` in _Year of interruption of smoking_ (`q_88d`) 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``A`` added in _Abnormal C9orf72 repeat-expansion_ (`q_98_1`) 
* ``Aunt maternal`` added in _Which family member 1 had a history of Alzheimer disease_ (`q_102a_1`) 
* `5` added in _Mother´s birth order_ (`q_107a`) 
* `"military officer"` removed in _Main Ocupation_ (`q_139`) 
* `"sergeant"` removed in _Main Ocupation_ (`q_140`) 
* ``Yes`` added in _Did specialist 3 made diagnosis_ (`q_154d_3`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0006`

* cannot convert value ``No`` to number in 69 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 31 questions: _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 17 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in `q_149b`, `q_149e`, `q_149h`, `q_152h`, `q_156h`, `q_16a`, `q_26a`, `q_27a` and `q_28a` 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`) and _7th timing_ (`q_48g_t`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g`, `q_24` and `q_30a` doesn't have defined level ``No`` 
* factor variable `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``2a Right Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``3b Left Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``2b Right Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``5a Left Lower limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``5b Left Lower limb – proximal`` added in _6th region_ (`q_48f_r`) 
* ``6 Respiratory symptoms`` added in _7th region_ (`q_48g_r`) 
* ``Thoracic`` replaces value ``Bulbar`` in _Region3_ (`q_50a`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Needs extra pillows in order to sleep (>2)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `4` added in _Father´s number of siblings_ (`q_108b`) 
* `"driver"` removed in _Main Ocupation_ (`q_139`) 
* `"repairman"` removed in _Second Occupation_ (`q_141`) 
* ``Large town– > 100 000`` added in _Place of living_ (`q_143`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0008`

* cannot convert value ``No`` to number in 61 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 28 questions: _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* cannot convert value ``Yes`` to number in 17 questions: `q_122a`, `q_149a`, `q_149d`, `q_149e`, `q_149f`, `q_149g`, `q_149h`, ...`q_29a`, `q_29b`, `q_29c` 
* ``No`` removed in 17 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* `2` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) and _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_16g`, `q_24` and `q_30a` doesn't have defined level ``No`` 
* factor variable `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) and _What cause of death of family member 2_ (`q_106_2b`) 
* `"Unknown"` added in _What other cause of death of family member 1_ (`q_106_1c`) and _What other cause of death of family member 2_ (`q_106_2c`) 
* `6` added in _Mother´s number of siblings_ (`q_107b`) and _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``5a Left Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``5b Left Lower limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``4a Right Lower limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``4b Right Lower limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``2b Right Upper limb – proximal`` added in _5th region_ (`q_48e_r`) 
* ``3b Left Upper limb – proximal`` added in _6th region_ (`q_48f_r`) 
* ``2017-11-30`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Mild unsteadiness or fatigue`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``Yes`` replaces value ``No`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Pending`` added in _Abnormal C9orf72 repeat-expansion_ (`q_98_1`) 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* `62` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* ``Son`` added in _Which family member 2 had died_ (`q_106_2a`) 
* `65` added in _Age of family member 2 at the moment of death_ (`q_106_2d`) 
* `"housewife"` removed in _Main Ocupation_ (`q_139`) 
* ``Cardiologist`` added in _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0012`

* cannot convert value ``No`` to number in 64 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 51 questions: _Other type of specialist 7 that observed the patient_ (`q_154c_7`), _ALSFRS(2) 1. Speech_ (`q_51_2.1`), _ALSFRS(2) 10. Dyspnea_ (`q_51_2.10`), _ALSFRS(2) 11. Orthopnea_ (`q_51_2.11`), _ALSFRS(2) 12. Respiratory insufficiency_ (`q_51_2.12`), _ALSFRS(2) 2. Salivation_ (`q_51_2.2`), _ALSFRS(2) 3. Swallowing_ (`q_51_2.3`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 35 questions: _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), _Regular specific diet - Paleo (High-protein, high-fat, low-carbohydrate)_ (`q_114h`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 14 questions: `q_149d`, `q_149e`, `q_149f`, `q_149g`, `q_149h`, `q_152h`, `q_156h`, ...`q_27c`, `q_29a`, `q_29c` 
* `2` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Regular specific diet - No_ (`q_114a`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - NA_ (`q_65a_8`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`) and _7th timing_ (`q_48g_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`), _Did specialist 2 made diagnosis_ (`q_154d_2`), _Did specialist 3 made diagnosis_ (`q_154d_3`) and _Did specialist 4 made diagnosis_ (`q_154d_4`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 2 observed the patient_ (`q_154b_2`), _What specialist 3 observed the patient_ (`q_154b_3`) and _What specialist 4 observed the patient_ (`q_154b_4`) 
* factor variable `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``NA`` removed in _Total Cholesterol lower range_ (`q_56b`), _LDL Cholesterol lower range_ (`q_58b`) and _Triglycerides lower range_ (`q_59b`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) and _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* ``No`` replaces value ``Yes`` in `q_63` and `q_94a` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Mother´s number of siblings_ (`q_107b`) and _Order of specialist 4 that observed the patient_ (`q_154a_4`) 
* `5` added in _Father´s number of siblings_ (`q_108b`) and _Number of siblings_ (`q_110a2`) 
* `3` added in _Siblings' birth order_ (`q_110a1`) and _Order of specialist 3 that observed the patient_ (`q_154a_3`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Internal Medicine`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``4a Right Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``5a Left Lower limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``2a Right Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``3a Left Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``1 Oro-facial`` added in _5th region_ (`q_48e_r`) 
* ``8 Thoracic/abdomen`` added in _6th region_ (`q_48f_r`) 
* ``6 Respiratory symptoms`` added in _7th region_ (`q_48g_r`) 
* ``2017-12-19`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Significant difficulty, considering using mechanical respiratory support`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Unable to sleep`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``Invasive mechanical ventilation by intubation or tracheostomy`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Brother`` added in _Which family member 1 had a history of other severe disease_ (`q_105_1a`) 
* ``Cancer prostate`` added in _What severe disease family member 1 had_ (`q_105_1b`) 
* ``Yes`` removed in `q_111` 
* `"housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0014`

* cannot convert value ``No`` to number in 62 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _How many family members 1 had a history of Alzheimer disease_ (`q_102a_2`), _Mother´s birth order_ (`q_107a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 19 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in 16 questions: `q_149d`, `q_149e`, `q_152h`, `q_156h`, `q_16a`, `q_24c`, `q_26a`, ...`q_28c`, `q_29a`, `q_29b` 
* `2` added in _Number of children_ (`q_110a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`), _6th timing_ (`q_48f_t`) and _7th timing_ (`q_48g_t`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_24`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g` and `q_30a` doesn't have defined level ``No`` 
* ``NA`` removed in _Total Cholesterol lower range_ (`q_56b`) and _Triglycerides lower range_ (`q_59b`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Father´s birth order_ (`q_108a`) and _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2011-04-02`` replaces value ``2011-02-04`` in _Date of Diagnosis_ (`q_13`) 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``3b Left Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``2a Right Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``2b Right Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``5a Left Lower limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``4a Right Lower limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``1 Oro-facial`` added in _7th region_ (`q_48g_r`) 
* ``2017-12-20`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Detectable speech disturbances`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Slight but definite excess of saliva in mouth; may have nightime drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Early eating problems - occasional choking`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Able to grip pen but unable to write`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Needs attendant for self-care`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can initiate, but not turn or adjust sheets alone`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Nonambulatory functional movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Some difficulty sleeping at night due to shortness of breath (does not routinely use more than two pillows)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Mother`` added in _Which family member 1 had a history of Alzheimer disease_ (`q_102a_1`) 
* `5` added in _Mother´s number of siblings_ (`q_107b`) 
* `6` added in _Father´s number of siblings_ (`q_108b`) 
* `"marketing"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0019`

* cannot convert value ``No`` to number in 63 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 31 questions: _Mother´s birth order_ (`q_107a`), _Number of children_ (`q_110a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 15 questions: `q_149g`, `q_156h`, `q_16a`, `q_24c`, `q_25a`, `q_25b`, `q_25c`, ...`q_28a`, `q_28b`, `q_29a` 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Siblings' birth order_ (`q_110a1`), _Number of siblings_ (`q_110a2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* factor variable `q_24`, `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `5` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s number of siblings_ (`q_108b`) 
* `"trainer"` removed in _Main Ocupation_ (`q_139`) and _Second Occupation_ (`q_141`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``General Practitioner`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2016-08-15`` replaces value ``2015-08-15`` in _Date of Invasive ventilation_ (`q_14`) 
* factor variable `q_16g` doesn't have defined level ``No`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``5a Left Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``4a Right Lower limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``3a Left Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``2a Right Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``6 Respiratory symptoms`` added in _5th region_ (`q_48e_r`) 
* ``7 Neck`` added in _6th region_ (`q_48f_r`) 
* ``2018-02-08`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Loss of useful speech`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Marked drooling; requires constant tissue or handkerchief`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``NPO (exclus. parenteral or enteral feeding)`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Able to grip pen but unable to write`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Food must be cut by someone, but can still feed slowly`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Significant difficulty, considering using mechanical respiratory support`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Some difficulty sleeping at night due to shortness of breath (does not routinely use more than two pillows)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``Invasive mechanical ventilation by intubation or tracheostomy`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `3` added in _Father´s birth order_ (`q_108a`) 
* ``Yes`` removed in `q_111` 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0020`

* cannot convert value ``No`` to number in 67 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Father´s birth order_ (`q_108a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 11 questions: `q_152d`, `q_152e`, `q_152h`, `q_156h`, `q_16a`, `q_24c`, `q_25a`, ...`q_26b`, `q_27a`, `q_28b` 
* `2` added in _Mother´s birth order_ (`q_107a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_24`, `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _6th timing_ (`q_48f_t`) and _7th timing_ (`q_48g_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``Same time`` added in _5th timing_ (`q_48e_t`) and _8th timing_ (`q_48h_t`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``General Practitioner`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* factor variable `q_16g` doesn't have defined level ``No`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Positive`` added in `q_43` 
* ``2a Right Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``3a Left Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``2b Right Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``3b Left Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``1 Oro-facial`` added in _5th region_ (`q_48e_r`) 
* ``5a Left Lower limb – distal`` added in _6th region_ (`q_48f_r`) 
* ``4a Right Lower limb – distal`` added in _7th region_ (`q_48g_r`) 
* ``8 Thoracic/abdomen`` added in _8th region_ (`q_48h_r`) 
* ``Lumbo-sacral`` replaces value ``Thoracic`` in _Region3_ (`q_50a`) 
* cannot convert value ``Speech combined with nonvocal communication`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Slight but definite excess of saliva in mouth; may have nightime drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Dietary consistency changes`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can turn alone or adjust sheets, but with great difficulty`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `9` added in _Father´s number of siblings_ (`q_108b`) 
* ``Yes`` added in `q_111` 
* `"farmer"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0023`

* cannot convert value ``No`` to number in 67 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _Mother´s birth order_ (`q_107a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 11 questions: `q_152d`, `q_152e`, `q_152h`, `q_156h`, `q_16a`, `q_26a`, `q_26b`, ...`q_28a`, `q_28b`, `q_29a` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`) and _5th timing_ (`q_48e_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_26`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Father´s birth order_ (`q_108a`) and _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper limb`` replaces value ``Upper and lower`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``2 Right Upper limb – distal and proximal`` added in _1st region_ (`q_48a_r`) 
* ``3 Left Upper limb – distal and proximal`` added in _2nd region_ (`q_48b_r`) 
* ``4 Right Lower limb – distal and proximal`` added in _3rd region_ (`q_48c_r`) 
* ``5 Left Lower limb – distal and proximal`` added in _4th region_ (`q_48d_r`) 
* ``7 Neck`` added in _5th region_ (`q_48e_r`) 
* ``Bulbar`` replaces value ``Thoracic`` in _Region3_ (`q_50a`) 
* ``2016-09-28`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Able to grip pen but unable to write`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Food must be cut by someone, but can still feed slowly`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Needs attendant for self-care`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can initiate, but not turn or adjust sheets alone`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Nonambulatory functional movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Some difficulty sleeping at night due to shortness of breath (does not routinely use more than two pillows)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``Yes`` replaces value ``No`` in `q_89a` 
* `"Lithium"` added in _Drug(s) used in psychiatric medication_ (`q_89b`) 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* `"Homozygous D90A"` replaces value `"Homozigot D90A"` in _SOD1 mutation type_ (`q_97b`) 
* `6` added in _Mother´s number of siblings_ (`q_107b`) 
* `5` added in _Father´s number of siblings_ (`q_108b`) 
* `3` added in _Number of children_ (`q_110a`) 
* ``Yes`` added in `q_111` 
* `"housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0025`

* cannot convert value ``No`` to number in 62 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 33 questions: _How many family members 1 had a history of Alzheimer disease_ (`q_102a_2`), _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), ..._Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`), _Mean number of packs/day_ (`q_88e`) 
* cannot convert value ``Yes`` to number in 16 questions: `q_149d`, `q_149e`, `q_149f`, `q_149g`, `q_149h`, `q_156h`, `q_16a`, ...`q_28a`, `q_28b`, `q_28c` 
* ``No`` removed in 13 questions: `q_123`, `q_125`, `q_126`, `q_127`, `q_129`, `q_130`, `q_131`, ...`q_135`, `q_136`, `q_137` 
* factor variable `q_124`, `q_128`, `q_138`, `q_24`, `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`) and _ALS depression inventory lower range_ (`q_47c`) 
* `2` added in _Number of children_ (`q_110a`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* `3` added in _Mother´s birth order_ (`q_107a`) and _Number of siblings_ (`q_110a2`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2016-09-21`` replaces value ``2016-09-10`` in _Date of Invasive ventilation_ (`q_14`) 
* factor variable `q_16g` doesn't have defined level ``No`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``3a Left Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``5a Left Lower limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``2a Right Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``4a Right Lower limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``1 Oro-facial`` added in _5th region_ (`q_48e_r`) 
* ``6 Respiratory symptoms`` added in _6th region_ (`q_48f_r`) 
* ``2016-09-20`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Intelligible with repeating`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Marked excess of saliva with some drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Dietary consistency changes`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Needs to be fed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Helpless`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``No purposeful leg movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Cannot do`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Significant difficulty, considering using mechanical respiratory support`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Some difficulty sleeping at night due to shortness of breath (does not routinely use more than two pillows)`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``Invasive mechanical ventilation by intubation or tracheostomy`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``NA`` replaces value `8` in _ALSFRS-R total_ (`q_51_1.score`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* `1985` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* `2010` replaces value ``NA`` in _Year of interruption of smoking_ (`q_88d`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Mother`` added in _Which family member 1 had a history of Alzheimer disease_ (`q_102a_1`) 
* `4` added in _Mother´s number of siblings_ (`q_107b`) 
* ``Head`` added in _Head/Neck trauma > 5 years_ (`q_116`) 
* `"Driver"` removed in _Main Ocupation_ (`q_139`) 
* `"EMG"` removed in _Investigation requested by the 1st specialist_ (`q_149`) 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0026`

* cannot convert value ``No`` to number in 71 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _Father´s birth order_ (`q_108a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 17 questions: `q_111`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in `q_149b`, `q_149e`, `q_152h`, `q_156h`, `q_16a`, `q_26a` and `q_28a` 
* `0` added in _Age of family member 1 at the moment of death_ (`q_106_1d`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* factor variable `q_16g`, `q_24` and `q_30a` doesn't have defined level ``No`` 
* factor variable `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``General Practitioner`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* ``Distal and proximal`` replaces value ``Proximal`` in _Predominant impairment_ (`q_18c`) 
* ``3b Left Upper limb – proximal`` added in _1st region_ (`q_48a_r`) 
* ``5b Left Lower limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``3a Left Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``5a Left Lower limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``2a Right Upper limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``2b Right Upper limb – proximal`` added in _6th region_ (`q_48f_r`) 
* ``Cervical`` replaces value ``Lumbo-sacral`` in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` replaces value ``Cervical`` in _Region2_ (`q_49b`) 
* ``2016-03-04`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Occurs with >= 1 of the following: eating, bathing, dressing (ADL)`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Mutation found`` removed in `q_97a` 
* `"SNP"` removed in _SOD1 mutation type_ (`q_97b`) 
* ``Son`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``Other violent death`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `6` added in _Mother´s birth order_ (`q_107a`) 
* `7` added in _Mother´s number of siblings_ (`q_107b`) 
* `4` added in _Father´s number of siblings_ (`q_108b`) 
* `3` added in _Number of siblings_ (`q_110a2`) 
* `"housewife"` removed in _Main Ocupation_ (`q_139`) 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0054`

* cannot convert value ``No`` to number in 61 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`), _Mean number of packs/day_ (`q_88e`) 
* cannot convert value ``Yes`` to number in 17 questions: `q_119c`, `q_152d`, `q_156h`, `q_16a`, `q_24b`, `q_24c`, `q_25a`, ...`q_29a`, `q_29b`, `q_29c` 
* ``No`` removed in 16 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_135`, `q_136`, `q_138` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`) and _ALS depression inventory lower range_ (`q_47c`) 
* `2` added in _Siblings' birth order_ (`q_110a1`), _Number of siblings_ (`q_110a2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* factor variable `q_16g`, `q_24`, `q_26` and `q_30a` doesn't have defined level ``No`` 
* `"Cleaner"` removed in _Main Ocupation_ (`q_139`), _Main Ocupation_ (`q_140`), _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* factor variable `q_137`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s birth order_ (`q_108a`) and _Father´s number of siblings_ (`q_108b`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Orthopaedist`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``No`` replaces value ``Yes`` in `q_37` 
* ``Lumbo-sacral`` removed in _Region1_ (`q_49a`) 
* ``Cervical`` removed in _Region2_ (`q_49b`) 
* ``Bulbar`` removed in _Region3_ (`q_50a`) 
* ``2017-06-24`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Intelligible with repeating`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Slight but definite excess of saliva in mouth; may have nightime drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Early eating problems - occasional choking`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Can cut most foods, although clumsy and slow; some help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Intermittent assistance or substitute methods`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Slow`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs when walking`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* cannot convert value ``Unable to sleep`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) 
* cannot convert value ``Invasive mechanical ventilation by intubation or tracheostomy`` to number in _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* `28` removed in _ALSFRS-R total_ (`q_51_1.score`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* _Year of initiation of smoking_ (`q_88b`) doesn't allow for tagged NA `2` 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"unknown"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `84` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* ``Neurosurgeon`` added in _Second specialist who observed the patient_ (`q_150`) 
* ``Neurologist`` added in _Specialist who made the diagnosis_ (`q_153`) 
* ``Yes`` added in _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* `"ANTA"` removed in `centr_id` 
* `29` replaces value `54` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0055`

* cannot convert value ``No`` to number in 65 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_135`, `q_136`, `q_137` 
* cannot convert value ``Yes`` to number in 13 questions: `q_152g`, `q_156h`, `q_16b`, `q_24b`, `q_24c`, `q_25a`, `q_26a`, ...`q_28b`, `q_28c`, `q_29a` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_138`, `q_24`, `q_26` and `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`), _Main Ocupation_ (`q_140`), _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* factor variable `q_16g`, `q_28` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Mother´s number of siblings_ (`q_107b`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Pneumologist`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2017-07-26`` removed in _Date of Death_ (`q_15`) 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Bulbar`` removed in _Region1_ (`q_49a`) 
* ``Cervical`` removed in _Region2_ (`q_49b`) 
* factor variable _Region3_ (`q_50a`) doesn't have defined level ``Cervical`` 
* ``2017-06-24`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Speech combined with nonvocal communication`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Moderately excessive saliva; may have minimal drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Dietary consistency changes`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Not all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Food must be cut by someone, but can still feed slowly`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Needs attendant for self-care`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can initiate, but not turn or adjust sheets alone`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Nonambulatory functional movement`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Mild unsteadiness or fatigue`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs at rest Shortness of breath at rest, difficulty breathing when either sitting or lying`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``Yes`` replaces value ``No`` in `q_63` 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"UNKNOWN"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `50` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `13` added in _Number of children_ (`q_110a`) 
* `3` added in _Siblings' birth order_ (`q_110a1`) 
* `8` added in _Number of siblings_ (`q_110a2`) 
* ``Other`` added in _Second specialist who observed the patient_ (`q_150`) 
* ``Neurologist`` added in _Specialist who made the diagnosis_ (`q_153`) 
* ``Yes`` added in _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* `"ANTA"` removed in `centr_id` 
* `30` replaces value `55` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0007`

* cannot convert value ``No`` to number in 67 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Mother´s birth order_ (`q_107a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 19 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in 11 questions: `q_149d`, `q_149e`, `q_149f`, `q_149g`, `q_152h`, `q_156h`, `q_16a`, ...`q_27a`, `q_27b`, `q_28a` 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`) and _5th timing_ (`q_48e_t`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g`, `q_24` and `q_30a` doesn't have defined level ``No`` 
* factor variable `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s birth order_ (`q_108a`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``2014-05-04`` replaces value ``2014-05-02`` in _Date of Diagnosis_ (`q_13`) 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``2a Right Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``3a Left Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``2b Right Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``3b Left Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``4a Right Lower limb – distal`` added in _5th region_ (`q_48e_r`) 
* ``2017-11-30`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Unable to grip pen`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Food must be cut by someone, but can still feed slowly`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Intermittent assistance or substitute methods`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``Yes`` replaces value ``No`` in `q_91a` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `7` added in _Father´s number of siblings_ (`q_108b`) 
* `4` added in _Siblings' birth order_ (`q_110a1`) 
* `9` added in _Number of siblings_ (`q_110a2`) 
* `"warden"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0009`

* cannot convert value ``No`` to number in 65 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`), _Mean number of packs/day_ (`q_88e`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 13 questions: `q_149d`, `q_149e`, `q_149g`, `q_156h`, `q_16a`, `q_24c`, `q_26a`, ...`q_28a`, `q_28b`, `q_29b` 
* factor variable `q_24`, `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`) and _ALS depression inventory lower range_ (`q_47c`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`) and _4th timing_ (`q_48d_t`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* `4` added in _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`) and _Siblings' birth order_ (`q_110a1`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`) and _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) and _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* factor variable `q_16g` doesn't have defined level ``No`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``2b Right Upper limb – proximal`` added in _1st region_ (`q_48a_r`) 
* ``2a Right Upper limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``3b Left Upper limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``3a Left Upper limb – distal`` added in _4th region_ (`q_48d_r`) 
* ``Bulbar`` removed in _Region2_ (`q_49b`) 
* ``2017-12-04`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `3` added in _Mother´s birth order_ (`q_107a`) 
* `5` added in _Mother´s number of siblings_ (`q_107b`) 
* `6` added in _Number of siblings_ (`q_110a2`) 
* `"driver"` removed in _Main Ocupation_ (`q_139`) 
* `"farmer"` removed in _Second Occupation_ (`q_141`) 
* ``Cardiologist`` added in _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Yes`` added in _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0010`

* cannot convert value ``No`` to number in 69 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in `q_156h`, `q_16a`, `q_26a`, `q_26b`, `q_26c`, `q_27a`, `q_27b`, `q_28a` and `q_28b` 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`), _4th timing_ (`q_48d_t`), _5th timing_ (`q_48e_t`) and _6th timing_ (`q_48f_t`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* factor variable `q_26`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) and _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* factor variable `q_16g` and `q_24` doesn't have defined level ``No`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Number of children_ (`q_110a`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` added in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* `0` replaces value `136` in _Cognition - ECAS upper range_ (`q_45c`) 
* ``5a Left Lower limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``4a Right Lower limb – distal`` added in _2nd region_ (`q_48b_r`) 
* ``5b Left Lower limb – proximal`` added in _3rd region_ (`q_48c_r`) 
* ``4b Right Lower limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``3b Left Upper limb – proximal`` added in _5th region_ (`q_48e_r`) 
* ``2b Right Upper limb – proximal`` added in _6th region_ (`q_48f_r`) 
* ``Thoracic`` removed in _Region3_ (`q_50a`) 
* ``2017-12-04`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `5` added in _Father´s number of siblings_ (`q_108b`) 
* `6` added in _Siblings' birth order_ (`q_110a1`) 
* `7` added in _Number of siblings_ (`q_110a2`) 
* `"repairman"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0013`

* cannot convert value ``No`` to number in 66 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 18 questions: `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, `q_130`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in 12 questions: `q_149d`, `q_149e`, `q_149f`, `q_152h`, `q_156h`, `q_16a`, `q_26b`, ...`q_27c`, `q_28a`, `q_28b` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Mother´s birth order_ (`q_107a`), _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`), _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_123`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g`, `q_24` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* ``Distal and proximal`` replaces value ``Proximal`` in _Predominant impairment_ (`q_18c`) 
* ``2b Right Upper limb – proximal`` added in _1st region_ (`q_48a_r`) 
* ``3b Left Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``After`` added in _2nd timing_ (`q_48b_t`) 
* ``2017-12-20`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``Yes`` replaces value ``No`` in `q_91a` 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `6` added in _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s birth order_ (`q_108a`) 
* `4` added in _Father´s number of siblings_ (`q_108b`) 
* `7` added in _Number of siblings_ (`q_110a2`) 
* `"farmer"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0021`

* cannot convert value ``No`` to number in 70 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 32 questions: _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in `q_149d`, `q_149h`, `q_152h`, `q_156h`, `q_16a`, `q_24c`, `q_26a` and `q_28a` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`), _What specialist 1 observed the patient_ (`q_154b_1`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_24`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`) and _4th timing_ (`q_48d_t`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* factor variable `q_16g` and `q_30a` doesn't have defined level ``No`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* `"ANTC0008"` added in _Control subject code_ (`q_3b`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``1 Oro-facial`` added in _1st region_ (`q_48a_r`) 
* ``2b Right Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``2a Right Upper limb – distal`` added in _3rd region_ (`q_48c_r`) 
* ``3b Left Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``Lumbo-sacral`` removed in _Region3_ (`q_50a`) 
* ``2016-03-01`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* `"Lithium"` replaces value `"Litium"` in _Drug(s) used in psychiatric medication_ (`q_89b`) 
* ``2014-01-01`` replaces value ``1905-07-06`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `10` added in _Mother´s number of siblings_ (`q_107b`) 
* `4` added in _Number of siblings_ (`q_110a2`) 
* ``Head`` added in _Head/Neck trauma > 5 years_ (`q_116`) 
* `"Teacher"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0024`

* cannot convert value ``No`` to number in 74 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Order of specialist 2 that observed the patient_ (`q_154a_2`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - Myelitis_ (`q_65a_4`), _Spinal cord MRI Thoracic - Tumor_ (`q_65b_2`) and _Spinal cord MRI Lumbo-sacral - Tumor_ (`q_65c_2`) 
* factor variable `q_24`, `q_26`, `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Yes`` to number in `q_156h`, `q_25b`, `q_26b` and `q_28b` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* `3` added in _Father´s birth order_ (`q_108a`), _Number of siblings_ (`q_110a2`), _How long moderate sport activity 1_ (`q_112a_1c`) and _How long moderate sport activity 2_ (`q_112a_2c`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), _Did specialist 1 made diagnosis_ (`q_154d_1`) and _Did specialist 2 made diagnosis_ (`q_154d_2`) 
* ``After`` added in _2nd timing_ (`q_48b_t`), _3rd timing_ (`q_48c_t`) and _4th timing_ (`q_48d_t`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 2 observed the patient_ (`q_154b_2`) 
* factor variable `q_16g` and `q_30a` doesn't have defined level ``No`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Mother´s number of siblings_ (`q_107b`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Internal Medicine`` added in _First specialist who observed the patient_ (`q_148`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``2a Right Upper limb – distal`` added in _1st region_ (`q_48a_r`) 
* ``2b Right Upper limb – proximal`` added in _2nd region_ (`q_48b_r`) 
* ``1 Oro-facial`` added in _3rd region_ (`q_48c_r`) 
* ``3b Left Upper limb – proximal`` added in _4th region_ (`q_48d_r`) 
* ``2016-08-11`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Detectable speech disturbances`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``No`` replaces value ``Yes`` in `q_63` 
* ``Yes`` replaces value ``No`` in `q_89a` 
* `"Lithium"` added in _Drug(s) used in psychiatric medication_ (`q_89b`) 
* ``2016-01-01`` replaces value ``1905-07-08`` in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `5` added in _Father´s number of siblings_ (`q_108b`) 
* ``Basketball`` added in _Type of moderate sport activity 1_ (`q_112a_1a`) 
* ``Fast walking`` added in _Type of moderate sport activity 2_ (`q_112a_2a`) 
* `"teacher"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTA"` removed in `centr_id` 

<!-- end of list -->



## Changes to the patient `ANTA-0052`

* cannot convert value ``No`` to number in 64 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 27 questions: _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), _Spinal cord MRI Cervical - Tumor_ (`q_65a_2`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 17 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 14 questions: `q_149d`, `q_152d`, `q_152h`, `q_156h`, `q_16b`, `q_24c`, `q_25b`, ...`q_28a`, `q_28b`, `q_28c` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Mother´s birth order_ (`q_107a`), _Number of children_ (`q_110a`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`), _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* factor variable `q_16g`, `q_24`, `q_26` and `q_30a` doesn't have defined level ``No`` 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`), _Main Ocupation_ (`q_140`), _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* factor variable `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `7` added in _Mother´s number of siblings_ (`q_107b`) and _Siblings' birth order_ (`q_110a1`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``1975-06-20`` replaces value ``1962-06-20`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``No`` replaces value ``Yes`` in `q_37` 
* ``Bulbar`` removed in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` removed in _Region2_ (`q_49b`) 
* factor variable _Region3_ (`q_50a`) doesn't have defined level ``Cervical`` 
* ``2017-06-23`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Speech combined with nonvocal communication`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Slight but definite excess of saliva in mouth; may have nightime drooling`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Early eating problems - occasional choking`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``Myocardial infarction`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `65` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `3` added in _Father´s birth order_ (`q_108a`) 
* `5` added in _Father´s number of siblings_ (`q_108b`) 
* `8` added in _Number of siblings_ (`q_110a2`) 
* ``NA`` removed in _Time gap between first-second specialist_ (`q_151`) 
* `"ANTA"` removed in `centr_id` 
* `27` replaces value `52` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0053`

* cannot convert value ``No`` to number in 71 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 20 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in `q_149h`, `q_156h`, `q_27a`, `q_27c`, `q_29a`, `q_29b` and `q_29c` 
* `2` added in _Mother´s birth order_ (`q_107a`), _Number of siblings_ (`q_110a2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_16g`, `q_24`, `q_26` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) and _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* factor variable `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s birth order_ (`q_108a`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* ``Distal and proximal`` replaces value ``Proximal`` in _Predominant impairment_ (`q_18c`) 
* ``Lumbo-sacral`` removed in _Region1_ (`q_49a`) 
* ``Cervical`` removed in _Region2_ (`q_49b`) 
* ``2017-06-23`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `"Fluoxetine"` replaces value `"FLUOXETİNE"` in _Drug(s) used in psychiatric medication_ (`q_89b`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had a history of other severe disease_ (`q_105_1a`) 
* ``Cancer lung`` added in _What severe disease family member 1 had_ (`q_105_1b`) 
* ``Mother`` added in _Which family member 2 had a history of other severe disease_ (`q_105_2a`) 
* ``other`` added in _What severe disease family member 2 had_ (`q_105_2b`) 
* `"stroke"` added in _What other severe disease family member 2 had_ (`q_105_2c`) 
* `4` added in _Father´s number of siblings_ (`q_108b`) 
* `"GRAFİC DESİGNER"` removed in _Main Ocupation_ (`q_139`) 
* ``Large town– > 100 000`` removed in _Place of living_ (`q_144`) 
* ``NA`` removed in _Time gap between first-second specialist_ (`q_151`) 
* ``Yes`` added in _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* `"ANTA"` removed in `centr_id` 
* `28` replaces value `53` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0056`

* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 57 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `1` added in 28 questions: _Siblings' birth order_ (`q_110a1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* cannot convert value ``Yes`` to number in 21 questions: `q_149d`, `q_149e`, `q_149f`, `q_149g`, `q_149h`, `q_152d`, `q_152e`, ...`q_29a`, `q_29b`, `q_29c` 
* ``No`` removed in 17 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* `2` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Number of children_ (`q_110a`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_16g`, `q_24`, `q_28` and `q_30a` doesn't have defined level ``No`` 
* `"farmer"` removed in _Main Ocupation_ (`q_139`), _Main Ocupation_ (`q_140`), _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* factor variable `q_26` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Father´s number of siblings_ (`q_108b`) and _Number of siblings_ (`q_110a2`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`) and _Second specialist who observed the patient_ (`q_150`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Cervical`` removed in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` removed in _Region2_ (`q_49b`) 
* ``Thoracic`` removed in _Region3_ (`q_50a`) 
* ``2017-06-24`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Able to grip pen but unable to write`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Can cut most foods, although clumsy and slow; some help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Total dependence`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Can initiate, but not turn or adjust sheets alone`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Needs assistance`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs at rest Shortness of breath at rest, difficulty breathing when either sitting or lying`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `8` added in _Mother´s number of siblings_ (`q_107b`) 
* ``No`` replaces value ``Yes`` in `q_145` 
* `"ANTA"` removed in `centr_id` 
* `31` replaces value `56` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0057`

* cannot convert value ``No`` to number in 62 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 31 questions: _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Siblings' birth order_ (`q_110a1`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* cannot convert value ``Yes`` to number in 16 questions: `q_149f`, `q_149g`, `q_152d`, `q_152e`, `q_152f`, `q_152g`, `q_152h`, ...`q_28b`, `q_29a`, `q_29b` 
* ``No`` removed in 15 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_135`, `q_136`, `q_138` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_134`, `q_137`, `q_28`, `q_30a` and `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Number of siblings_ (`q_110a2`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* `"mechanical enjineer"` removed in _Main Ocupation_ (`q_139`), _Main Ocupation_ (`q_140`), _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* factor variable `q_16g`, `q_24` and `q_26` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) and _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``1026-09-23`` replaces value ``2016-09-23`` in _Date of consultation_ (`q_4`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Lumbo-sacral`` removed in _Region1_ (`q_49a`) 
* ``Cervical`` removed in _Region2_ (`q_49b`) 
* ``2017-06-24`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Somewhat slow and clumsy, but no help needed`` to number in _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``Walks with assistance`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Mild unsteadiness or fatigue`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* ``other`` added in _What cause of death of family member 1_ (`q_106_1b`) 
* `"UNKNOWN"` added in _What other cause of death of family member 1_ (`q_106_1c`) 
* `67` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* `4` added in _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s number of siblings_ (`q_108b`) 
* ``Yes`` added in _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* `"ANTA"` removed in `centr_id` 
* `32` replaces value `57` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0058`

* cannot convert value ``No`` to number in 77 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Lives in Rural Area/Urban_ (`q_143a`), _Lives in Rural Area/Urban_ (`q_144a`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 20 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_145`, `q_146`, `q_147` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Number of children_ (`q_110a`), _Siblings' birth order_ (`q_110a1`), _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`), _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* factor variable `q_16g`, `q_24`, `q_26` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`) and _Specialist who made the diagnosis_ (`q_153`) 
* factor variable `q_28` and `q_99.c1` doesn't have defined level ``Yes`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Mother´s birth order_ (`q_107a`) and _Father´s birth order_ (`q_108a`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* cannot convert value ``Yes`` to number in `q_16a` 
* ``Upper and lower`` replaces value ``Lower limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Cervical`` removed in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` removed in _Region2_ (`q_49b`) 
* ``2017-06-24`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `8` added in _Mother´s number of siblings_ (`q_107b`) 
* `11` added in _Father´s number of siblings_ (`q_108b`) 
* `7` added in _Number of siblings_ (`q_110a2`) 
* `"ANTA"` removed in `centr_id` 
* `33` replaces value `58` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0060`

* cannot convert value ``No`` to number in 69 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 27 questions: _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), _Brain MRI - NA_ (`q_64_7`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 20 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_145`, `q_146`, `q_147` 
* cannot convert value ``Yes`` to number in `q_149a`, `q_149h`, `q_152h`, `q_156h`, `q_16a`, `q_24c`, `q_26a`, `q_26b` and `q_26c` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`), _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`), _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`), _ALSFRS(1) 8. Walking_ (`q_51_1.8`) and _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* `2` added in _Number of children_ (`q_110a`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - NA_ (`q_65a_8`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* factor variable `q_16g`, `q_24`, `q_28` and `q_30a` doesn't have defined level ``No`` 
* cannot convert value ``None`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`), _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* `3` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`) and _Siblings' birth order_ (`q_110a1`) 
* `6` added in _Mother´s number of siblings_ (`q_107b`), _Father´s number of siblings_ (`q_108b`) and _Number of siblings_ (`q_110a2`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`) and _Specialist who made the diagnosis_ (`q_153`) 
* factor variable `q_26` and `q_99.c1` doesn't have defined level ``Yes`` 
* ``Stroke - type unknown`` added in _What severe disease family member 1 had_ (`q_105_1b`) and _What cause of death of family member 1_ (`q_106_1b`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Cervical`` removed in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` removed in _Region2_ (`q_49b`) 
* ``Thoracic`` removed in _Region3_ (`q_50a`) 
* ``2017-06-25`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Intelligible with repeating`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Normal function`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* `2016` replaces value ``NA`` in _Year of interruption of smoking_ (`q_88d`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* ``Mother`` added in _Which family member 1 had a history of other severe disease_ (`q_105_1a`) 
* ``Father`` added in _Which family member 1 had died_ (`q_106_1a`) 
* `53` added in _Age of family member 1 at the moment of death_ (`q_106_1d`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_144a`) 
* `"ANTA"` removed in `centr_id` 
* `35` replaces value `60` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0061`

* cannot convert value ``No`` to number in 66 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 59 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 30 questions: _Mother´s birth order_ (`q_107a`), _Mother´s number of siblings_ (`q_107b`), _Order of specialist 1 that observed the patient_ (`q_154a_1`), _Brain MRI - Normal_ (`q_64_1`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 17 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_136`, `q_137`, `q_138` 
* cannot convert value ``Yes`` to number in 12 questions: `q_149d`, `q_149e`, `q_152h`, `q_156h`, `q_16a`, `q_26a`, `q_26b`, ...`q_27b`, `q_28a`, `q_28c` 
* `0` added in _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* `2` added in _Number of children_ (`q_110a`), _Brain MRI - Tumor_ (`q_64_2`), _Spinal cord MRI Cervical - NA_ (`q_65a_8`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* factor variable `q_16g`, `q_24`, `q_28` and `q_30a` doesn't have defined level ``No`` 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`), _Main Ocupation_ (`q_140`), _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* ``Neurologist`` added in _First specialist who observed the patient_ (`q_148`), _Second specialist who observed the patient_ (`q_150`), _Specialist who made the diagnosis_ (`q_153`) and _What specialist 1 observed the patient_ (`q_154b_1`) 
* factor variable `q_26` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Normal`` to number in _ALSFRS(1) 2. Salivation_ (`q_51_1.2`) and _ALSFRS(1) 7. Turning in Bed and Adjusting Bed Clothes_ (`q_51_1.7`) 
* cannot convert value ``None`` to number in _ALSFRS(1) 11. Orthopnea_ (`q_51_1.11`) and _ALSFRS(1) 12. Respiratory insufficiency_ (`q_51_1.12`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Father´s birth order_ (`q_108a`) and _Number of siblings_ (`q_110a2`) 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Cervical`` removed in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` removed in _Region2_ (`q_49b`) 
* ``Thoracic`` removed in _Region3_ (`q_50a`) 
* ``2017-06-25`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* cannot convert value ``Normal speech processes`` to number in _ALSFRS(1) 1. Speech_ (`q_51_1.1`) 
* cannot convert value ``Normal eating habits`` to number in _ALSFRS(1) 3. Swallowing_ (`q_51_1.3`) 
* cannot convert value ``Slow or sloppy; all words are legible`` to number in _ALSFRS(1) 4. Handwriting_ (`q_51_1.4`) 
* cannot convert value ``Can cut most foods, although clumsy and slow; some help needed`` to number in _ALSFRS(1) 5. Cutting Food and Handling Utensils_ (`q_51_1.5`) 
* cannot convert value ``Independent and complete self-care with effort of decreased efficiency`` to number in _ALSFRS(1) 6. Dressing and Hygiene_ (`q_51_1.6`) 
* cannot convert value ``Early ambulation difficulties`` to number in _ALSFRS(1) 8. Walking_ (`q_51_1.8`) 
* cannot convert value ``Mild unsteadiness or fatigue`` to number in _ALSFRS(1) 9. Climbing Stairs_ (`q_51_1.9`) 
* cannot convert value ``Occurs when walking`` to number in _ALSFRS(1) 10. Dyspnea_ (`q_51_1.10`) 
* `40` removed in _ALSFRS-R total_ (`q_51_1.score`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* `5` added in _Father´s number of siblings_ (`q_108b`) 
* `3` added in _Siblings' birth order_ (`q_110a1`) 
* ``Yes`` added in _Did specialist 1 made diagnosis_ (`q_154d_1`) 
* `"ANTA"` removed in `centr_id` 
* `36` replaces value `61` in `x` 

<!-- end of list -->



## Changes to the patient `ANTA-0059`

* cannot convert value ``No`` to number in 78 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_38.1b`, `q_38.2a`, `q_38.2b` 
* `NA` added in 71 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* `1` added in 29 questions: _Lives in Rural Area/Urban_ (`q_143a`), _Lives in Rural Area/Urban_ (`q_144a`), _Brain MRI - Tumor_ (`q_64_2`), _Brain MRI - Stroke_ (`q_64_3`), _Brain MRI - Multiple Sclerosis_ (`q_64_4`), _Brain MRI - Trauma_ (`q_64_5`), _Brain MRI - Hypoxia_ (`q_64_6`), ..._Spinal cord MRI Lumbo-sacral - Syringomyelia_ (`q_65c_6`), _Spinal cord MRI Lumbo-sacral - Other_ (`q_65c_7`), _Spinal cord MRI Lumbo-sacral - NA_ (`q_65c_8`) 
* ``No`` removed in 20 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_145`, `q_146`, `q_147` 
* `0` added in _Cognition - ECAS value (or NF, NA, NR)_ (`q_45a`), _Cognition - ECAS lower range_ (`q_45b`), _Cognition - ECAS upper range_ (`q_45c`), _ALS depression inventory value  (or NF, NA, NR)_ (`q_47a`), _ALS depression inventory upper range_ (`q_47b`), _ALS depression inventory lower range_ (`q_47c`) and _Mean number of packs/day_ (`q_88e`) 
* factor variable `q_16g`, `q_24`, `q_28` and `q_30a` doesn't have defined level ``No`` 
* `2` added in _Brain MRI - Normal_ (`q_64_1`), _Spinal cord MRI Cervical - Normal_ (`q_65a_1`), _Spinal cord MRI Thoracic - Normal_ (`q_65b_1`) and _Spinal cord MRI Lumbo-sacral - Normal_ (`q_65c_1`) 
* factor variable `q_26` and `q_99.c1` doesn't have defined level ``Yes`` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``No`` added in _Head/Neck trauma in the last 5 years_ (`q_115`) and _Head/Neck trauma > 5 years_ (`q_116`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``Lower limb`` replaces value ``Upper limb`` in _Limb onset_ (`q_18a`) 
* factor variable _Predominant impairment_ (`q_18c`) doesn't have defined level ``Distal`` 
* ``Cervical`` removed in _Region1_ (`q_49a`) 
* ``Lumbo-sacral`` removed in _Region2_ (`q_49b`) 
* ``2017-06-25`` added in _ALSFRS(1) Acquisition date_ (`q_51_1.date`) 
* ``NA`` replaces value ``NA`` in _ALSFRS(1) Rate of decay_ (`q_51_1.rate`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* ``Yes`` replaces value ``No`` in `q_96a` 
* `"ghj"` added in _Immunosupressor's name_ (`q_96b`) 
* ``Wt/wt (normal)`` removed in `q_97a` 
* `"ANTA"` removed in `centr_id` 
* `34` replaces value `59` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0001`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 15 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_135`, `q_136`, `q_138` 
* `1` added in `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* factor variable `q_137` and `q_99.c1` doesn't have defined level ``Yes`` 
* `6` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s number of siblings_ (`q_108b`) 
* `"No"` removed in _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* `"ANTC0001"` replaces value `"ANTA0001"` in _Control subject code_ (`q_3b`) 
* ``2016-01-11`` replaces value ``2086-01-12`` in _Date of consultation_ (`q_4`) 
* ``1974-04-23`` replaces value ``2044-04-24`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `1996` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* `5` added in _Mother´s birth order_ (`q_107a`) 
* `4` added in _Father´s birth order_ (`q_108a`) 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTC"` removed in `centr_id` 
* `37` replaces value `571` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0002`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` removed in 19 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_145`, `q_146`, `q_147` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* `1` added in _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Siblings' birth order_ (`q_110a1`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `"no"` removed in _Second Occupation_ (`q_141`) and _Second Occupation_ (`q_142`) 
* ``Large town– > 100 000`` removed in _Place of living_ (`q_143`) and _Place of living_ (`q_144`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-01-01`` replaces value ``2086-01-02`` in _Date of consultation_ (`q_4`) 
* ``1950-04-02`` replaces value ``2020-04-03`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* ``Type II`` replaces value ``Type I`` in `q_74` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Mother´s birth order_ (`q_107a`) 
* `4` added in _Mother´s number of siblings_ (`q_107b`) 
* `5` added in _Number of siblings_ (`q_110a2`) 
* ``Yes`` removed in `q_111` 
* `"cook"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTC"` removed in `centr_id` 
* `38` replaces value `572` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0003`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in _Father´s birth order_ (`q_108a`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `7` added in _Father´s number of siblings_ (`q_108b`) and _Number of siblings_ (`q_110a2`) 
* `"Farmer"` removed in _Main Ocupation_ (`q_140`) and _Second Occupation_ (`q_141`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-05-26`` replaces value ``2086-05-28`` in _Date of consultation_ (`q_4`) 
* ``1959-11-02`` replaces value ``2029-11-03`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Mother´s birth order_ (`q_107a`) 
* `5` added in _Mother´s number of siblings_ (`q_107b`) 
* `4` added in _Siblings' birth order_ (`q_110a1`) 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTC"` removed in `centr_id` 
* `39` replaces value `573` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0004`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) and _Father´s birth order_ (`q_108a`) 
* cannot convert value ``Rural area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-05-02`` replaces value ``2086-05-04`` in _Date of consultation_ (`q_4`) 
* ``1971-07-21`` replaces value ``2041-07-22`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Mother´s birth order_ (`q_107a`) 
* `6` added in _Father´s number of siblings_ (`q_108b`) 
* `4` added in _Siblings' birth order_ (`q_110a1`) 
* `8` added in _Number of siblings_ (`q_110a2`) 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTC"` removed in `centr_id` 
* `40` replaces value `574` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0005`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 15 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_135`, `q_136`, `q_138` 
* `1` added in _Siblings' birth order_ (`q_110a1`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* `3` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`) and _Number of siblings_ (`q_110a2`) 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* factor variable `q_137` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-02-01`` replaces value ``2086-02-02`` in _Date of consultation_ (`q_4`) 
* ``1968-11-15`` replaces value ``2038-11-17`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* `8` added in _Mother´s number of siblings_ (`q_107b`) 
* `7` added in _Father´s number of siblings_ (`q_108b`) 
* `"Cook"` removed in _Main Ocupation_ (`q_139`) 
* `"Housewife"` removed in _Main Ocupation_ (`q_140`) 
* `"ANTC"` removed in `centr_id` 
* `41` replaces value `575` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0006`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in _Mother´s birth order_ (`q_107a`), _Father´s birth order_ (`q_108a`), _Lives in Rural Area/Urban_ (`q_143a`), _Lives in Rural Area/Urban_ (`q_144a`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-04-21`` replaces value ``2086-04-23`` in _Date of consultation_ (`q_4`) 
* ``1970-01-01`` added in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `3` added in _Mother´s number of siblings_ (`q_107b`) 
* `5` added in _Father´s number of siblings_ (`q_108b`) 
* `6` added in _Siblings' birth order_ (`q_110a1`) 
* `7` added in _Number of siblings_ (`q_110a2`) 
* `"ANTC"` removed in `centr_id` 
* `42` replaces value `576` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0007`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in _Mother´s birth order_ (`q_107a`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `3` added in _Father´s birth order_ (`q_108a`) and _Father´s number of siblings_ (`q_108b`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-01-01`` replaces value ``2086-01-02`` in _Date of consultation_ (`q_4`) 
* ``1960-05-01`` replaces value ``2030-05-03`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `11` added in _Mother´s number of siblings_ (`q_107b`) 
* `"Housewife"` removed in _Main Ocupation_ (`q_139`) 
* `"ANTC"` removed in `centr_id` 
* `43` replaces value `577` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0008`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` removed in 19 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_145`, `q_146`, `q_147` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* `1` added in `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Father´s number of siblings_ (`q_108b`) 
* `2` added in _Father´s birth order_ (`q_108a`) and _Siblings' birth order_ (`q_110a1`) 
* `3` added in _Number of siblings_ (`q_110a2`) and _How long moderate sport activity 1_ (`q_112a_1c`) 
* ``Large town– > 100 000`` removed in _Place of living_ (`q_143`) and _Place of living_ (`q_144`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-02-10`` replaces value ``2086-02-11`` in _Date of consultation_ (`q_4`) 
* ``1975-10-03`` replaces value ``2045-10-04`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `6` added in _Mother´s number of siblings_ (`q_107b`) 
* ``Fast walking`` added in _Type of moderate sport activity 1_ (`q_112a_1a`) 
* `"Tourism"` removed in _Main Ocupation_ (`q_139`) 
* `"Insurer"` removed in _Main Ocupation_ (`q_140`) 
* `"ANTC"` removed in `centr_id` 
* `44` replaces value `578` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0009`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in _Father´s birth order_ (`q_108a`), _Father´s number of siblings_ (`q_108b`), _Lives in Rural Area/Urban_ (`q_143a`), _Lives in Rural Area/Urban_ (`q_144a`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `4` added in _Mother´s birth order_ (`q_107a`) and _Mother´s number of siblings_ (`q_107b`) 
* `5` added in _Siblings' birth order_ (`q_110a1`) and _Number of siblings_ (`q_110a2`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-02-26`` replaces value ``2086-02-27`` in _Date of consultation_ (`q_4`) 
* ``1959-01-01`` replaces value ``2029-01-02`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `"ANTC"` removed in `centr_id` 
* `45` replaces value `579` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0010`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 24 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 16 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in _Siblings' birth order_ (`q_110a1`), _Lives in Rural Area/Urban_ (`q_143a`), _Lives in Rural Area/Urban_ (`q_144a`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* _Year of initiation of smoking_ (`q_88b`) and _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `5` added in _Mother´s birth order_ (`q_107a`) and _Number of siblings_ (`q_110a2`) 
* `4` added in _Father´s number of siblings_ (`q_108b`) and _Number of children_ (`q_110a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-08-12`` replaces value ``2086-08-14`` in _Date of consultation_ (`q_4`) 
* ``1974-05-04`` replaces value ``2044-05-05`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* factor variable `q_99.c1` doesn't have defined level ``Yes`` 
* `10` added in _Mother´s number of siblings_ (`q_107b`) 
* `3` added in _Father´s birth order_ (`q_108a`) 
* `"ANTC"` removed in `centr_id` 
* `46` replaces value `580` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0011`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 23 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* ``No`` removed in 14 questions: `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, `q_129`, ...`q_136`, `q_137`, `q_138` 
* `1` added in _Father´s birth order_ (`q_108a`), _Siblings' birth order_ (`q_110a1`), `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* factor variable `q_133`, `q_134` and `q_99.c1` doesn't have defined level ``Yes`` 
* `2` added in _Mother´s birth order_ (`q_107a`) and _Father´s number of siblings_ (`q_108b`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2016-03-11`` replaces value ``2086-03-13`` in _Date of consultation_ (`q_4`) 
* ``1979-01-18`` replaces value ``2049-01-19`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* `2` replaces value ``NA`` in _Year of initiation of smoking_ (`q_88b`) 
* _Year of interruption of smoking_ (`q_88d`) doesn't allow for tagged NA `2` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* `9` added in _Mother´s number of siblings_ (`q_107b`) 
* `4` added in _Number of siblings_ (`q_110a2`) 
* cannot convert value ``Yes`` to number in `q_121a` 
* `"Tourism"` removed in _Main Ocupation_ (`q_139`) 
* `"No"` removed in _Second Occupation_ (`q_141`) 
* `"ANTC"` removed in `centr_id` 
* `47` replaces value `581` in `x` 

<!-- end of list -->



## Changes to the patient `ANTC0012`

* `NA` added in 152 questions: _Regular specific diet - No_ (`q_114a`), _Regular specific diet - Mediterranean_ (`q_114b`), _Regular specific diet - Vegetarian_ (`q_114c`), _Regular specific diet - Vegan_ (`q_114d`), _Regular specific diet - Gluten-free_ (`q_114e`), _Regular specific diet - High protein_ (`q_114f`), _Regular specific diet - Low carbohydrate_ (`q_114g`), ..._Metastasis - Colon_ (`q_85b_7`), _Metastasis - Rectum_ (`q_85b_8`), _Metastasis - other Abdominal_ (`q_85b_9`) 
* cannot convert value ``No`` to number in 22 questions: `q_117a`, `q_117b`, `q_117c`, `q_118a`, `q_118b`, `q_118c`, `q_119a`, ...`q_144c`, `q_144d`, `q_144e` 
* ``No`` removed in 19 questions: `q_110d`, `q_123`, `q_124`, `q_125`, `q_126`, `q_127`, `q_128`, ...`q_145`, `q_146`, `q_147` 
* ``No`` added in 16 questions: _Head/Neck trauma in the last 5 years_ (`q_115`), _Head/Neck trauma > 5 years_ (`q_116`), `q_19`, `q_20`, `q_21`, `q_30`, `q_31`, ...`q_40`, `q_41`, `q_63` 
* `1` added in `q_38.1a`, `q_38.1b`, `q_38.2a` and `q_38.2b` 
* factor variable `q_133` and `q_99.c1` doesn't have defined level ``Yes`` 
* cannot convert value ``Yes`` to number in `q_120b` and `q_120c` 
* `"Technician"` removed in _Main Ocupation_ (`q_139`) and _Second Occupation_ (`q_141`) 
* ``Large town– > 100 000`` removed in _Place of living_ (`q_143`) and _Place of living_ (`q_144`) 
* cannot convert value ``Urban area`` to number in _Lives in Rural Area/Urban_ (`q_143a`) and _Lives in Rural Area/Urban_ (`q_144a`) 
* ``Antalya`` added in _Medical facility_ (`facility_id`) 
* ``Hilmi Uysal`` added in _Physician recording the data_ (`person_id`) 
* ``2017-01-12`` replaces value ``2087-01-14`` in _Date of consultation_ (`q_4`) 
* ``1967-01-01`` replaces value ``2037-01-02`` in _Date of birth_ (`q_5`) 
* factor variable _Ethinicity_ (`q_7`) doesn't have defined level ``Caucassian`` 
* ``None`` added in _Which cognitive symptoms at onset_ (`q_22`) 
* ``Right`` added in _Handedness_ (`q_23`) 
* ``Positive`` added in `q_43` 
* ``Type II`` replaces value ``Type I`` in `q_74` 
* _Year of initiation of smoking_ (`q_88b`) doesn't allow for tagged NA `2` 
* `0` added in _Mean number of packs/day_ (`q_88e`) 
* ``2018-02-20`` added in _Date of initiation of Riluzole_ (`q_91b`) 
* `"ANTC"` removed in `centr_id` 
* `48` replaces value `582` in `x` 

<!-- end of list -->





# Changes to data structure and layout when transforming _df1_ into _df2_

The paragraph below shows differences in data layout between the datasets

## Changes to the question property Variable name

* `""` replaces value `"Place of living"` for q_143 and q_144 
* `""` replaces value `"Lives in Rural Area/Urban"` for q_143a and q_144a 
* `""` replaces value `"Medical facility"` for facility_id 
* `""` replaces value `"Physician recording the data"` for person_id 
* `"Familial history of ALS"` replaces value `"How many family members 1 had a history of ALS"` for q_100a_2 
* `"Familial history of ALS"` replaces value `"How many family members 2 had a history of ALS"` for q_100b_2 
* `"Familial history of ALS"` replaces value `"How many family members 3 had a history of ALS"` for q_100c_2 
* `"Familial history of FTD"` replaces value `"How many family members 1 had a history of FTD"` for q_101a_2 
* `"Familial history of FTD"` replaces value `"How many family members 2 had a history of FTD"` for q_101b_2 
* `"Familial history of FTD"` replaces value `"How many family members 3 had a history of FTD"` for q_101c_2 
* `"Familial history of Alzheimer disease"` replaces value `"How many family members 1 had a history of Alzheimer disease"` for q_102a_2 
* `"Familial history of Alzheimer disease"` replaces value `"How many family members 2 had a history of Alzheimer disease"` for q_102b_2 
* `"Familial history of Alzheimer disease"` replaces value `"How many family members 3 had a history of Alzheimer disease"` for q_102c_2 
* `"Familial history of Parkinson disease"` replaces value `"How many family members 1 had a history of Parkinson disease"` for q_103a_2 
* `"Family history of multiple sclerosis"` replaces value `"How many family members 1 had a history of multiple scrlerosis"` for q_104a_2 
* `"Family history of multiple sclerosis"` replaces value `"How many family members 2 had a history of multiple scrlerosis"` for q_104b_2 
* `"Parents’ and siblings´ causes of death"` replaces value `"Age of family member 1 at the moment of death"` for q_106_1d 
* `"Parents’ and siblings´ causes of death"` replaces value `"Age of family member 2 at the moment of death"` for q_106_2d 
* `"Parents’ and siblings´ causes of death"` replaces value `"Age of family member 3 at the moment of death"` for q_106_3d 
* `"Parents’ and siblings´ causes of death"` replaces value `"Age of family member 4 at the moment of death"` for q_106_4d 
* `"Mother´s number of siblings and birth order"` replaces value `"Mother´s birth order"` for q_107a 
* `"Mother´s number of siblings and birth order"` replaces value `"Mother´s number of siblings"` for q_107b 
* `"Father´s number of siblings and birth order"` replaces value `"Father´s birth order"` for q_108a 
* `"Father´s number of siblings and birth order"` replaces value `"Father´s number of siblings"` for q_108b 
* `""` replaces value `"Father's Place of birth"` for q_10a 
* `""` replaces value `"Father's Place of birth characteristics"` for q_10b 
* `""` replaces value `"Date of 1st Symptoms"` for q_11 
* `"Number of siblings and birth order"` replaces value `"Siblings' birth order"` for q_110a1 
* `"Number of siblings and birth order"` replaces value `"Number of siblings"` for q_110a2 
* `"Moderate aerobic activity (such as fast walking, swimming) >150 min/week"` replaces value `"How long moderate sport activity 1"` for q_112a_1c 
* `"Moderate aerobic activity (such as fast walking, swimming) >150 min/week"` replaces value `"How long moderate sport activity 2"` for q_112a_2c 
* `"Moderate aerobic activity (such as fast walking, swimming) >150 min/week"` replaces value `"How long moderate sport activity 3"` for q_112a_3c 
* `"Moderate aerobic activity (such as fast walking, swimming) >150 min/week"` replaces value `"How long moderate sport activity 4"` for q_112a_4c 
* `"Vigorous aerobic activity (such as running or aerobic dancing) >75 min/week"` replaces value `"How long vigorous sport activity 1"` for q_112b_1c 
* `"Vigorous aerobic activity (such as running or aerobic dancing) >75 min/week"` replaces value `"How long vigorous sport activity 2"` for q_112b_2c 
* `"Vigorous aerobic activity (such as running or aerobic dancing) >75 min/week"` replaces value `"How long vigorous sport activity 3"` for q_112b_3c 
* `"Mild physical exercise <75 min/week, >1 year"` replaces value `"How long mild sport activity 1"` for q_113_1c 
* `"Mild physical exercise <75 min/week, >1 year"` replaces value `"How long mild sport activity 2"` for q_113_2c 
* `""` replaces value `"Regular specific diet - No"` for q_114a 
* `""` replaces value `"Regular specific diet - Mediterranean"` for q_114b 
* `""` replaces value `"Regular specific diet - Vegetarian"` for q_114c 
* `""` replaces value `"Regular specific diet - Vegan"` for q_114d 
* `""` replaces value `"Regular specific diet - Gluten-free"` for q_114e 
* `""` replaces value `"Regular specific diet - High protein"` for q_114f 
* `""` replaces value `"Regular specific diet - Low carbohydrate"` for q_114g 
* `""` replaces value `"Regular specific diet - Paleo (High-protein, high-fat, low-carbohydrate)"` for q_114h 
* `""` replaces value `"Date of 1st Medical Consultation"` for q_12 
* `""` replaces value `"Date of Diagnosis"` for q_13 
* `""` replaces value `"Date of Invasive ventilation"` for q_14 
* `""` replaces value `"Date of Death"` for q_15 
* `"Time gap between first-second specialist (months)"` replaces value `"Time gap between first-second specialist"` for q_151 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 1 that observed the patient"` for q_154a_1 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 2 that observed the patient"` for q_154a_2 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 3 that observed the patient"` for q_154a_3 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 4 that observed the patient"` for q_154a_4 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 5 that observed the patient"` for q_154a_5 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 6 that observed the patient"` for q_154a_6 
* `"Order of specialists that observed the patient"` replaces value `"Order of specialist 7 that observed the patient"` for q_154a_7 
* `"Order of specialists that observed the patient"` replaces value `"Other type of specialist 7 that observed the patient"` for q_154c_7 
* `""` replaces value `"Did specialist 1 made diagnosis"` for q_154d_1 
* `""` replaces value `"Did specialist 2 made diagnosis"` for q_154d_2 
* `""` replaces value `"Did specialist 3 made diagnosis"` for q_154d_3 
* `""` replaces value `"Did specialist 4 made diagnosis"` for q_154d_4 
* `""` replaces value `"Did specialist 5 made diagnosis"` for q_154d_5 
* `""` replaces value `"Did specialist 6 made diagnosis"` for q_154d_6 
* `""` replaces value `"Did specialist 7 made diagnosis"` for q_154d_7 
* `"Time gap between first medical observation and the specialist who made the diagnosis (months)"` replaces value `"Time gap between first medical observation and diagnosis"` for q_155 
* `"Generalized onset"` replaces value `""` for q_16g 
* `""` replaces value `"UMN vs LMN manifestation at onset"` for q_17 
* `""` replaces value `"Limb onset"` for q_18a 
* `""` replaces value `"Predominant side"` for q_18b 
* `""` replaces value `"Which cognitive symptoms at onset"` for q_22 
* `""` replaces value `"Handedness"` for q_23 
* `"Bulbar region"` replaces value `""` for q_24 
* `"Upper Limbs"` replaces value `""` for q_26 
* `"Lower Limbs"` replaces value `""` for q_28 
* `"Axial muscles"` replaces value `""` for q_30a 
* `""` replaces value `"Alternative diagnosis"` for q_36b 
* `""` replaces value `"Sensory changes"` for q_39 
* `""` replaces value `"Date of consultation"` for q_4 
* `"Postural instability - NURT"` replaces value `""` for q_42 
* `""` replaces value `"Cognition - Qualitative evaluation"` for q_44 
* `"Cognition – ECAS observed value (normal range)"` replaces value `"Cognition - ECAS value (or NF, NA, NR)"` for q_45a 
* `"Cognition – ECAS observed value (normal range)"` replaces value `"Cognition - ECAS lower range"` for q_45b 
* `"Cognition – ECAS observed value (normal range)"` replaces value `"Cognition - ECAS upper range"` for q_45c 
* `""` replaces value `"Depression - Qualitative evaluation"` for q_46 
* `"Depression - ALS depression inventory"` replaces value `"ALS depression inventory value  (or NF, NA, NR)"` for q_47a 
* `"Depression - ALS depression inventory"` replaces value `"ALS depression inventory upper range"` for q_47b 
* `"Depression - ALS depression inventory"` replaces value `"ALS depression inventory lower range"` for q_47c 
* `"Timing of transition from region 1 to 2 (months)"` replaces value `"Timing of transition from region 1 to 2"` for q_49c 
* `""` replaces value `"Date of birth"` for q_5 
* `"Timing of transition from region 2 to 3 (months)"` replaces value `"Timing of transition from region 2 to 3"` for q_50b 
* `""` replaces value `"ALSFRS(1) Acquisition date"` for q_51_1.date 
* `"ALSFRS(1) Score"` replaces value `"ALSFRS-R total"` for q_51_1.score 
* `""` replaces value `"ALSFRS(2) Acquisition date"` for q_51_2.date 
* `"ALSFRS-R history"` replaces value `"ALSFRS-R take 2 total"` for q_51_2.score 
* `""` replaces value `"Gender"` for q_6 
* `""` replaces value `"Brain MRI - Normal"` for q_64_1 
* `""` replaces value `"Brain MRI - Tumor"` for q_64_2 
* `""` replaces value `"Brain MRI - Stroke"` for q_64_3 
* `""` replaces value `"Brain MRI - Multiple Sclerosis"` for q_64_4 
* `""` replaces value `"Brain MRI - Trauma"` for q_64_5 
* `""` replaces value `"Brain MRI - Hypoxia"` for q_64_6 
* `""` replaces value `"Brain MRI - NA"` for q_64_7 
* `""` replaces value `"Spinal cord MRI Cervical - Normal"` for q_65a_1 
* `""` replaces value `"Spinal cord MRI Cervical - Tumor"` for q_65a_2 
* `""` replaces value `"Spinal cord MRI Cervical - Stenosis"` for q_65a_3 
* `""` replaces value `"Spinal cord MRI Cervical - Myelitis"` for q_65a_4 
* `""` replaces value `"Spinal cord MRI Cervical - Trauma"` for q_65a_5 
* `""` replaces value `"Spinal cord MRI Cervical - Syringomyelia"` for q_65a_6 
* `""` replaces value `"Spinal cord MRI Cervical - Other"` for q_65a_7 
* `""` replaces value `"Spinal cord MRI Cervical - NA"` for q_65a_8 
* `""` replaces value `"Spinal cord MRI Thoracic - Normal"` for q_65b_1 
* `""` replaces value `"Spinal cord MRI Thoracic - Tumor"` for q_65b_2 
* `""` replaces value `"Spinal cord MRI Thoracic - Stenosis"` for q_65b_3 
* `""` replaces value `"Spinal cord MRI Thoracic - Myelitis"` for q_65b_4 
* `""` replaces value `"Spinal cord MRI Thoracic - Trauma"` for q_65b_5 
* `""` replaces value `"Spinal cord MRI Thoracic - Syringomyelia"` for q_65b_6 
* `""` replaces value `"Spinal cord MRI Thoracic - Other"` for q_65b_7 
* `""` replaces value `"Spinal cord MRI Thoracic - NA"` for q_65b_8 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Normal"` for q_65c_1 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Tumor"` for q_65c_2 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Stenosis"` for q_65c_3 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Myelitis"` for q_65c_4 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Trauma"` for q_65c_5 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Syringomyelia"` for q_65c_6 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - Other"` for q_65c_7 
* `""` replaces value `"Spinal cord MRI Lumbo-sacral - NA"` for q_65c_8 
* `""` replaces value `"Ethinicity"` for q_7 
* `"Diabetes – type I / II"` replaces value `""` for q_74 
* `""` replaces value `"Primary cancer - Brain"` for q_85a_1 
* `""` replaces value `"Primary cancer - Prostate"` for q_85a_10 
* `""` replaces value `"Primary cancer - Uterus"` for q_85a_11 
* `""` replaces value `"Primary cancer - other Plevic"` for q_85a_12 
* `""` replaces value `"Primary cancer - Spine"` for q_85a_13 
* `""` replaces value `"Primary cancer - UL bone & sarcomas"` for q_85a_14 
* `""` replaces value `"Primary cancer - LL bone & sarcomas"` for q_85a_15 
* `""` replaces value `"Primary cancer - Skin"` for q_85a_16 
* `""` replaces value `"Primary cancer - Leukemia"` for q_85a_17 
* `""` replaces value `"Primary cancer - Lymphoma"` for q_85a_18 
* `""` replaces value `"Primary cancer - other Blood"` for q_85a_19 
* `""` replaces value `"Primary cancer - Neck"` for q_85a_2 
* `""` replaces value `"Primary cancer - Breast"` for q_85a_3 
* `""` replaces value `"Primary cancer - Lung"` for q_85a_4 
* `""` replaces value `"Primary cancer - other Thoracic"` for q_85a_5 
* `""` replaces value `"Primary cancer - Gastric"` for q_85a_6 
* `""` replaces value `"Primary cancer - Colon"` for q_85a_7 
* `""` replaces value `"Primary cancer - Rectum"` for q_85a_8 
* `""` replaces value `"Primary cancer - other Abdominal"` for q_85a_9 
* `""` replaces value `"Metastasis - Brain"` for q_85b_1 
* `""` replaces value `"Metastasis - Prostate"` for q_85b_10 
* `""` replaces value `"Metastasis - Uterus"` for q_85b_11 
* `""` replaces value `"Metastasis - other Plevic"` for q_85b_12 
* `""` replaces value `"Metastasis - Spine"` for q_85b_13 
* `""` replaces value `"Metastasis - UL bone & sarcomas"` for q_85b_14 
* `""` replaces value `"Metastasis - LL bone & sarcomas"` for q_85b_15 
* `""` replaces value `"Metastasis - Skin"` for q_85b_16 
* `""` replaces value `"Metastasis - Leukemia"` for q_85b_17 
* `""` replaces value `"Metastasis - Lymphoma"` for q_85b_18 
* `""` replaces value `"Metastasis - other Blood"` for q_85b_19 
* `""` replaces value `"Metastasis - Neck"` for q_85b_2 
* `""` replaces value `"Metastasis - Breast"` for q_85b_3 
* `""` replaces value `"Metastasis - Lung"` for q_85b_4 
* `""` replaces value `"Metastasis - other Thoracic"` for q_85b_5 
* `""` replaces value `"Metastasis - Gastric"` for q_85b_6 
* `""` replaces value `"Metastasis - Colon"` for q_85b_7 
* `""` replaces value `"Metastasis - Rectum"` for q_85b_8 
* `""` replaces value `"Metastasis - other Abdominal"` for q_85b_9 
* `"Date of initiation of smoking (year)"` replaces value `"Year of initiation of smoking"` for q_88b 
* `"Date of interruption of smoking (year)"` replaces value `"Year of interruption of smoking"` for q_88d 
* `""` replaces value `"Place of birth"` for q_8a 
* `""` replaces value `"Place of birth characteristics"` for q_8b 
* `""` replaces value `"Date of initiation of Riluzole"` for q_91b 
* `""` replaces value `"Abnormal C9orf72 repeat-expansion"` for q_98_1 
* `""` replaces value `"TBK1 mutation"` for q_98_2a 
* `""` replaces value `"Other gene 1"` for q_99.a1 
* `""` replaces value `"Other gene 2"` for q_99.a2 
* `"Was the patient included in other genomic studies"` replaces value `""` for q_99.c1 
* `""` replaces value `"Mother's Place of birth"` for q_9a 
* `""` replaces value `"Mother's Place of birth characteristics"` for q_9b 

<!-- end of list -->



## Changes to the question property Variable labels dictionary

* `""` replaces value `"1="No";2="Yes""` for 155 questions: q_114a, q_114b, q_114c, q_114d, q_114e, q_114f, q_114g, ...q_85b_7, q_85b_8, q_85b_9 
* `""` replaces value `"NA(c)="NR";NA(a)="NA";NA(b)="NF""` for q_88b, q_88d and q_88e 
* `""` replaces value `"1="Rural area";2="Urban area""` for q_143a and q_144a 
* `""` replaces value `"NA(a)="NA";NA(d)="unknown""` for q_49c and q_50b 
* `""` replaces value `"0="Loss of useful speech";1="Speech combined with nonvocal communication";2="Intelligible with repeating";3="Detectable speech disturbances";4="Normal speech processes""` for q_51_1.1 and q_51_2.1 
* `""` replaces value `"0="Significant difficulty, considering using mechanical respiratory support";1="Occurs at rest Shortness of breath at rest, difficulty breathing when either sitting or lying";2="Occurs with >= 1 of the following: eating, bathing, dressing (ADL)";3="Occurs when walking";4="None""` for q_51_1.10 and q_51_2.10 
* `""` replaces value `"0="Unable to sleep";1="Can only sleep sitting up";2="Needs extra pillows in order to sleep (>2)";3="Some difficulty sleeping at night due to shortness of breath (does not routinely use more than two pillows)";4="None""` for q_51_1.11 and q_51_2.11 
* `""` replaces value `"0="Invasive mechanical ventilation by intubation or tracheostomy";1="Continuous use of BiPAP during the night and day";2="Continuous use of BiPAP during the night";3="Intermittent use of BiPAP";4="None""` for q_51_1.12 and q_51_2.12 
* `""` replaces value `"0="Marked drooling; requires constant tissue or handkerchief";1="Marked excess of saliva with some drooling";2="Moderately excessive saliva; may have minimal drooling";3="Slight but definite excess of saliva in mouth; may have nightime drooling";4="Normal""` for q_51_1.2 and q_51_2.2 
* `""` replaces value `"0="NPO (exclus. parenteral or enteral feeding)";1="Needs supplemental tube feeding";2="Dietary consistency changes";3="Early eating problems - occasional choking";4="Normal eating habits""` for q_51_1.3 and q_51_2.3 
* `""` replaces value `"0="Unable to grip pen";1="Able to grip pen but unable to write";2="Not all words are legible";3="Slow or sloppy; all words are legible";4="Normal""` for q_51_1.4 and q_51_2.4 
* `""` replaces value `"0="Needs to be fed";1="Food must be cut by someone, but can still feed slowly";2="Can cut most foods, although clumsy and slow; some help needed";3="Somewhat slow and clumsy, but no help needed";4="Normal""` for q_51_1.5 and q_51_2.5 
* `""` replaces value `"0="Total dependence";1="Needs attendant for self-care";2="Intermittent assistance or substitute methods";3="Independent and complete self-care with effort of decreased efficiency";4="Normal function""` for q_51_1.6 and q_51_2.6 
* `""` replaces value `"0="Helpless";1="Can initiate, but not turn or adjust sheets alone";2="Can turn alone or adjust sheets, but with great difficulty";3="Somewhat slow and clumsy, but no help needed";4="Normal""` for q_51_1.7 and q_51_2.7 
* `""` replaces value `"0="No purposeful leg movement";1="Nonambulatory functional movement";2="Walks with assistance";3="Early ambulation difficulties";4="Normal""` for q_51_1.8 and q_51_2.8 
* `""` replaces value `"0="Cannot do";1="Needs assistance";2="Mild unsteadiness or fatigue";3="Slow";4="Normal""` for q_51_1.9 and q_51_2.9 
* `"1="Antalya";2="Hannover";3="Jena";4="Lisbon";5="Pisa";6="Warsaw""` replaces value `""` for facility_id 
* `"1="Annalisa Logerfo";2="B Stubbendorf";3="Hilmi Uysal";4="K Szacka";5="Mamede de Carvalho";6="Susanne Petri-Mals""` replaces value `""` for person_id 
* `""` replaces value `"NA(a)="NA";NA(b)="NF";NA(c)="NR""` for q_151 
* `""` replaces value `"NA(a)="NA";NA(b)="NF""` for q_155 
* `"1="No answer required for this field""` replaces value `"1="No answer required for this field";2="NA""` for q_156 
* `""` replaces value `"1="Positive";2="Negative";NA(b)="Positive";NA(b)="Negative""` for q_42 
* `"1="No";2="Head";3="Neck";4="Head and neck""` replaces value `"1="No";2="Head";3="Neck";4="Head and neck";5="NA";6="Yes""` for q_87b 

<!-- end of list -->



## Changes to the question property class

* ``integer`` replaces value ``nominal`` for 157 questions: q_114a, q_114b, q_114c, q_114d, q_114e, q_114f, q_114g, ...q_85b_7, q_85b_8, q_85b_9 
* ``integer`` added for 45 questions: q_100a_2, q_100b_2, q_100c_2, q_100d_2, q_101a_2, q_101b_2, q_101c_2, ...q_47c, q_51_2.score, x 
* ``integer`` replaces value ``labelled`` for 24 questions: q_51_1.1, q_51_1.10, q_51_1.11, q_51_1.12, q_51_1.2, q_51_1.3, q_51_1.4, ...q_51_2.7, q_51_2.8, q_51_2.9 
* ``integer`` replaces value ``real number`` for 17 questions: q_107a, q_107b, q_108a, q_108b, q_110a1, q_110a2, q_112a_1c, ...q_88b, q_88d, q_88e 
* ``nominal`` replaces value ``text`` for facility_id and person_id 
* ``integer`` replaces value ``text`` for q_154c_7 
* ``real number`` added for q_51_1.score 

<!-- end of list -->



## Other items

* ``NA`` removed in Theoretical min for q_4 and q_5 
* ``NA`` added in Theoretical min for q_51_1.score 

<!-- end of list -->



* `"F"` added in measure_type for q_16g, q_24, q_26, q_28, q_30a, q_74 and q_99.c1 
* `"I"` added in measure_type for q_51_1.score 

<!-- end of list -->



* `FALSE` replaces value `TRUE` in Force only values that are labelled for 168 questions: q_11, q_114a, q_114b, q_114c, q_114d, q_114e, q_114f, ...q_85b_7, q_85b_8, q_85b_9 
* `TRUE` replaces value `FALSE` in Force only values that are labelled for facility_id, person_id and q_51_1.score 

<!-- end of list -->



* `"FALSE"` added in Force only integral values for q_74 

<!-- end of list -->



* ``NA`` removed in Theoretical max for q_4 and q_5 

<!-- end of list -->



* `"FALSE"` replaces value `"1"` in Force only non-missing values for facility_id, person_id, q_11, q_13, q_4, q_5, q_6 and q_7 

<!-- end of list -->



* `0` removed in warnings_context for 14 questions: facility_id, person_id, q_107a, q_107b, q_108a, q_108b, q_110a1, ...q_113_1c, q_151, q_155 

<!-- end of list -->




