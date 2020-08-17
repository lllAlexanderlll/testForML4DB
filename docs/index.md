# Python Documentation

## Classes

**[Estimator](Estimator.md)**: Class containing the neural network for cardinality estimation. The specifications of the neural network can be changed in 'config.yaml'. 

**[Vectorizer](Vectorizer.md)**: Constructs a vector consisting of operator code and normalized value for each predicate in the sql query set with set_query method. 


## Functions

### parse_query_file



#### Parameters
name | description | default
--- | --- | ---
file_path |  | 
save_file_path |  | 
inner_separator |  | None
outer_separator |  | None
query_format |  | None





### collect_meta



#### Parameters
name | description | default
--- | --- | ---
file_path |  | 
config_file_path |  | 
save_file_path |  | 





### vectorize



#### Parameters
name | description | default
--- | --- | ---
queries_with_cardinalities_csv_path |  | 
output_base_path |  | 
output_result_folder |  | 
output_base_filename |  | 
output_filetypes |  | 





### estimate



#### Parameters
name | description | default
--- | --- | ---
data_path |  | 
config_file_path |  | 
save_model_file_path |  | 





### communicate



#### Parameters
name | description | default
--- | --- | ---
input_file_path |  | 
query_number |  | 
nullqueries |  | 
save_file_path |  | 
config_file_path |  | 





### vectorize_query_original


Copy-pasted method of the original implementation for testing purposes; Only added Join detection   
:param query: the query to vectorize :param min_max: dictionary of all min, max, step values for each predicate :param encoders: dictionary, which maps predicates to encoders :return: the normalized vector without cardinalities 
#### Parameters
name | description | default
--- | --- | ---
query |  | 
min_max |  | 
encoders |  | 





### vectorizer_tests


Test method to compare the original implementation with jupyter notebook output (truth) or with the Vectorizer implementation. Succeeds if no assertion throws an error. 



