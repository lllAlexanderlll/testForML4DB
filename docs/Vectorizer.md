# Vectorizer


Constructs a vector consisting of operator code and normalized value for each predicate in the sql query set with set_query method. 

## Methods


### __init__


Intitialises the Vectorizer object by defining available operators. 

#### Parameters
name | description | default
--- | --- | ---
self |  | 





### add_queries_with_cardinalities


Reads CSV file with format (querySetID;query;encodings;max_card;min_max_step;estimated_cardinality;true_cardinality) whereas min_max_step is an array of the format [[1, 2, 1], [1, 113, 1], [1878, 2115, 1]] sorted by lexicographic order of corresponding predicates and encodings is an empty array if only integer values are processed. For a querySetID all predicates are collected and sorted in lexicographical order to provide correct indices (e.g. in encodings & min_max_value) for a given predicate. Read queries are added to the list of vectorisation tasks.   


#### Parameters
name | description | default
--- | --- | ---
queries_with_cardinalities_path: | path to a CSV file containing all queries and their estimated and true cardinalities | 
self |  | 
queries_with_cardinalities_path |  | 





### vectorize


Vectorizes all vectorization tasks added.   


#### Parameters
name | description | default
--- | --- | ---
self |  | 





### __parse_expression


Parses the given expression. Parsing does not rely on spaces before and after operator, since these could be omitted within a query. Returns parse result: predicate, operator and value.   


#### Parameters
name | description | default
--- | --- | ---
expression: | an exptression of a WHERE clause (are usually seperated by AND/ OR) e.g. 'kind_id != 8' | 
self |  | 
expression |  | 





### __normalize


Normalizes the value according to min-max statistics of the given predicate and the querySetID. If an encoding is avaiable for the predicate it is used. Normalization will result in value of range (0,1].   


#### Parameters
name | description | default
--- | --- | ---
querySetID: | id of the querySet to get the meta data for the given predicate | 
predicate: | attribute of the value | 
value: | the value to be normalized | 
self |  | 
querySetID |  | 
predicate |  | 
value |  | 





### __min_max_normalize


Executes a min max normalization   


#### Parameters
name | description | default
--- | --- | ---
value: | the value to be normalized | 
max_cardinality: | maximal cardinality of the query set. Its logarithm is the max value for normalization | 
min_value: | minimal value as lower limit. Default is 0 | 
self |  | 
value |  | 
max_cardinality |  | 
min_value |  | 0





### save


Stores the SQL query and corresponding vector at given path as NPY and TXT file.   


#### Parameters
name | description | default
--- | --- | ---
base_path: | path to a directory for saving | 
result_folder: | name of folder to create for storing multiple files. This argument is seperated from base_path to empathize the need for an extra folder, since multiple files are saved. | 
filename: | filename without filetype. querySetID is appended for differentiation | 
filetypes: | string of file types must contain "csv" or "npy" | 
self |  | 
base_path |  | 
result_folder |  | 
base_filename |  | 
filetypes |  | 




