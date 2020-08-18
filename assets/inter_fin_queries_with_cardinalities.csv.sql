SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id<=2 AND t.production_year>1916
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id>=1 AND t.production_year=1946
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id<=1 AND t.production_year!=2006
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id<=1 AND t.production_year>2005
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id=1 AND t.production_year!=1955
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id<=2 AND t.production_year=2096
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id>=1 AND t.production_year>=2053
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id<=1 AND t.production_year!=1987
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id!=1 AND t.production_year>=2093
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id=2 AND t.production_year<=1916
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id>=1 AND t.production_year<=2009
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id>=2 AND t.production_year>1956
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id=1 AND t.production_year=2109
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id>=2 AND t.production_year>2084
SELECT COUNT(*) FROM movie_companies mc,movie_info_idx mi_idx,title t WHERE t.id=mc.movie_id AND t.id=mi_idx.movie_id AND mc.company_type_id=1 AND t.production_year<1973
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id<=2 AND mk.keyword_id>68570 AND t.production_year<=2068
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id>1 AND mk.keyword_id<=197791 AND t.production_year<2099
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id=2 AND mk.keyword_id=172436 AND t.production_year!=2003
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=2 AND mk.keyword_id!=193392 AND t.production_year!=2019
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id=1 AND mk.keyword_id<12301 AND t.production_year!=1950
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id>=2 AND mk.keyword_id<=127583 AND t.production_year=1977
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=2 AND mk.keyword_id<=202907 AND t.production_year>2052
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=1 AND mk.keyword_id!=228834 AND t.production_year>=2073
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=2 AND mk.keyword_id!=27633 AND t.production_year!=1932
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id>=1 AND mk.keyword_id!=36033 AND t.production_year<=2043
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=1 AND mk.keyword_id!=137693 AND t.production_year>1992
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id>1 AND mk.keyword_id<=18225 AND t.production_year!=1983
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=1 AND mk.keyword_id!=73456 AND t.production_year>=1879
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id<2 AND mk.keyword_id>221250 AND t.production_year!=1927
SELECT COUNT(*) FROM movie_companies mc,movie_keyword mk,title t WHERE t.id=mc.movie_id AND t.id=mk.movie_id AND mc.company_type_id!=2 AND mk.keyword_id=16971 AND t.production_year>=2023
