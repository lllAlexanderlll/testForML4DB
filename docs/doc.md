<a name="main"></a>
# main

<a name="estimator"></a>
# estimator

<a name="estimator.estimator"></a>
# estimator.estimator

<a name="estimator.estimator.Estimator"></a>
## Estimator Objects

```python
class Estimator()
```

Class containing the neural network for cardinality estimation. The specifications of the neural network can be
changed in 'config.yaml'.

<a name="estimator.estimator.Estimator.__init__"></a>
#### \_\_init\_\_

```python
 | __init__(config: Dict[str, Any] = None, config_file_path: str = "config.yaml", data: np.ndarray = None, model: Model = None, model_path: str = None, debug: bool = True)
```

Initializer for the Estimator.

Configuration options for the neural network are optionally passed via a config dict.
It must contain at least the fields "loss_function", "dropout", "learning_rate", "kernel_initializer",
"activation_strategy" and "layer".

**Arguments**:

- `config`: Only used if neither a model or a model_path is passed.
if given: It must contain at least the fields "loss_function", "dropout", "learning_rate",
"kernel_initializer", "activation_strategy" and "layer".
if not given: the config file 'config.yaml' is used for these settings.
- `config_file_path`: path for the config-file -> only necessary if no config is given
- `data`: Optional parameter for giving the data for training and testing. If given it has to be a Dict with
at least "x" and "y" and optionally "postgres_estimate" as keys. The values have to be numpy.ndarray. For
key "x" it should be the vectorized queries, for key "y" the true cardinalities in the same order and for
optional key "postgres_estimate" the estimates of the postgres optimizer for the query.
- `model`: Option to pass a Model which can be used.
- `model_path`: Option to pass a path to a saved model in an .h5 file.
- `debug`: Boolean whether to print additional information while processing.

<a name="estimator.estimator.Estimator.get_model"></a>
#### get\_model

```python
 | get_model(len_input: int, override: bool = False) -> Model
```

Function for creating the model of the neural network with the information from self.config

**Arguments**:

- `len_input`: The size of the input vector.
- `override`: Whether an existing model should be overridden.

**Returns**:

The model for the neural network with the given properties.

<a name="estimator.estimator.Estimator.load_model"></a>
#### load\_model

```python
 | load_model(model_path: str)
```

Method for loading an already existing model wich was saved to file.

**Arguments**:

- `model_path`: Path to the file containing the model to load

<a name="estimator.estimator.Estimator.denormalize"></a>
#### denormalize

```python
 | @staticmethod
 | denormalize(y, y_min: float, y_max: float)
```

**Arguments**:

- `y`: tensor filled with values to denormalize
- `y_min`: minimum value for y
- `y_max`: maximum value for y

**Returns**:

tensor with denormalized values

<a name="estimator.estimator.Estimator.denormalize_np"></a>
#### denormalize\_np

```python
 | @staticmethod
 | denormalize_np(y: np.ndarray, y_min: float, y_max: float) -> np.ndarray
```

**Arguments**:

- `y`: numpy-array filled with values to denormalize
- `y_min`: minimum value for y
- `y_max`: maximum value for y

**Returns**:

numpy-array with denormalized values

<a name="estimator.estimator.Estimator.load_data_file"></a>
#### load\_data\_file

```python
 | load_data_file(file_path: str, override: bool = False) -> Dict[str, np.ndarray]
```

Method for loading the data from file.

**Arguments**:

- `file_path`: Path for the file where the data is stored. Has to be a .csv or .npy file.
- `override`: Boolean whether to override already existing data.

**Returns**:

The data which is set for the Estimator.

<a name="estimator.estimator.Estimator.set_data"></a>
#### set\_data

```python
 | set_data(loaded_data: np.ndarray, override: bool = False)
```

Method for setting data and dependent values like max_card and input_length.

**Arguments**:

- `loaded_data`: The data loaded from the file.
- `override`: Boolean whether to override already existing data.

<a name="estimator.estimator.Estimator.split_data"></a>
#### split\_data

```python
 | split_data(split: float = 0.9)
```

Function to split the data into training- and test-set by a parameterized split value.

**Arguments**:

- `split`: Percentage of the data going into training set. (split=0.9 means 90% of data is training set)

<a name="estimator.estimator.Estimator.train"></a>
#### train

```python
 | train(epochs: int = 100, verbose: int = 1, shuffle: bool = True, batch_size: int = 32, validation_split: float = 0.1) -> Union[History, History]
```

Method for training the before created Model.

**Arguments**:

- `epochs`: Number of epochs for training.
- `verbose`: How much information to print while training. 0 = silent, 1 = progress bar, 2 = one line per
epoch.
- `shuffle`: Whether to shuffle the training data -> not necessary if split was done by numpy.random.choice()
- `batch_size`: Size for the batches -> Smaller batches may be able to train the neural network better
(possibly) but enlarge training time, while bigger batches may lead to a less well trained network while
training faster.
- `validation_split`: How much of the data should be taken as validation set -> these are taken from the
training data, not the test data, and are reselected for every epoch.

**Returns**:

Training history as dict.

<a name="estimator.estimator.Estimator.test"></a>
#### test

```python
 | test() -> np.ndarray
```

Let the trained neural network predict the test data.

**Returns**:

numpy-array containing the normalized predictions of the neural network for the test data

<a name="estimator.estimator.Estimator.predict"></a>
#### predict

```python
 | predict(data: np.ndarray) -> np.ndarray
```

Let the trained neural network predict the given data.

**Arguments**:

- `data`: numpy-array containing at least one vectorized query which should be predicted

**Returns**:

numpy-array containing the normalized predictions of the neural network for the given data

<a name="estimator.estimator.Estimator.run"></a>
#### run

```python
 | run(data_file_path: str = None, epochs: int = 100, verbose: int = 1, shuffle: bool = True, batch_size: int = 32, validation_split: float = 0.1, override_model: bool = False, save_model: bool = True, save_model_file_path: str = "model") -> np.ndarray
```

Method for a full run of the Estimator, with training and testing.

**Arguments**:

- `data_file_path`: Optional path to saved data file. Only necessary if no data has been set before.
- `epochs`: Number of epochs for training.
- `verbose`: How much information to print while training. 0 = silent, 1 = progress bar, 2 = one line per
epoch.
- `shuffle`: Whether to shuffle the training data -> not necessary if split was done by numpy.random.choice()
- `batch_size`: Size for the batches -> Smaller batches may be able to train the neural network better
(possibly) but enlarge training time, while bigger batches may lead to a less well trained network while
training faster.
- `validation_split`: How much of the data should be taken as validation set -> these are taken from the
training data, not the test data, and are reselected for every epoch.
- `override_model`: Whether to override a probably already existing model.
- `save_model`: Whether to save the trained model to file.
- `save_model_file_path`: When save_model==True this parameter is required to give the path where the model
should be saved.

**Returns**:

A numpy.ndarray containing the calculated q-error.

<a name="estimator.estimator.Estimator.save_model"></a>
#### save\_model

```python
 | save_model(filename: str = "model")
```

Method for saving the Model to file.

**Arguments**:

- `filename`: Name of the file where the model should be stored. (Without file ending. ".h5" is added to the
filename)

<a name="query_parser"></a>
# query\_parser

<a name="query_parser.query_parser"></a>
# query\_parser.query\_parser

<a name="query_parser.query_parser.QueryParser"></a>
## QueryParser Objects

```python
class QueryParser()
```

Class for the query_parser. This is responsible of reading a given file and return a file containing the aggregated
information of this file.

<a name="query_parser.query_parser.QueryParser.read_file"></a>
#### read\_file

```python
 | read_file(file_path: str, inner_separator: str = None, outer_separator: str = None, query_format: QueryFormat = QueryFormat.CROSS_PRODUCT) -> Tuple[Dict, str, str, str]
```

Generic Method for reading the sql statements from a given .sql or a .csv file.

**Arguments**:

- `file_path`: Path to the file containing the sql statements. This path has to end with .csv or .sql. No
other file types are supported at the moment.
- `inner_separator`: The column separator used in the file. You can use '\t' for .tsv files. -> See
documentation for details.
- `outer_separator`: The block separator used in the file. -> See documentation for details.
- `query_format`: The format of the sql query. Look at documentation of QueryFormat for details.
:return

<a name="query_parser.query_parser.QueryParser.read_sql_file"></a>
#### read\_sql\_file

```python
 | @staticmethod
 | read_sql_file(file_path: str, query_format: QueryFormat = QueryFormat.CROSS_PRODUCT) -> Tuple[Dict, str, str, str]
```

Read the sql statements from given sql file.

**Arguments**:

- `file_path`: Path to the file containing the sql statements.
- `query_format`: The format of the sql query. Look at documentation of QueryFormat for details.
:return

<a name="query_parser.query_parser.QueryParser.read_csv_file"></a>
#### read\_csv\_file

```python
 | @staticmethod
 | read_csv_file(file_path: str, inner_separator: str = ",", outer_separator: str = "#") -> Tuple[Dict, str, str, str]
```

Read the csv formatted sql statements from given file.

**Arguments**:

- `file_path`: Path to the file containing the sql statements formatted as csv.
- `inner_separator`: The column separator used in the file. You can use '\t' for .tsv files. -> See
documentation for details.
- `outer_separator`: The block separator used in the file. -> See documentation for details.
:return

<a name="query_parser.query_parser.QueryParser.create_solution_dict"></a>
#### create\_solution\_dict

```python
 | create_solution_dict(command_dict: Dict[str, List[str] or List[Tuple[str, str]]], file_type: str, inner_separator: str) -> Dict[int, Dict[str, List[str or Tuple[str, str]]]]
```

Method for building the solution dict.

**Arguments**:

- `command_dict`: Dict with a alphabetical sorted string of the joining tables as key and a list of where
clauses as string if the file type is sql or a list of tuples containing the join-attribute-string in first
and the selection-attribute-string in second place.
- `file_type`: String with 'csv'/'tsv' or 'sql' which tells the file type of the read file.
- `inner_separator`: The column separator used in the file. You can use '\t' for .tsv files. -> See
documentation for details.
:return The solution dict containing 'table_names', 'join_attributes' and 'selection_attributes'.

<a name="query_parser.query_parser.QueryParser.table_name_unpacker"></a>
#### table\_name\_unpacker

```python
 | @staticmethod
 | table_name_unpacker(from_string: str, separator: str = ",") -> List[Tuple[str, str]]
```

Takes the sorted string of the from clause and extracts the tables with their aliases.

**Arguments**:

- `from_string`: Alphabetical ordered string containing all tables to join, separated by the separator.
- `separator`: The column separator used in the file. You can use '\t' for .tsv files.

**Returns**:

List of tuples where the first element of the tuple is the table name and the second one is the alias.

<a name="query_parser.query_parser.QueryParser.sql_attribute_unpacker"></a>
#### sql\_attribute\_unpacker

```python
 | sql_attribute_unpacker(where_string_list: List[str]) -> Tuple[List[str], List[str]]
```

Unpack the attribute strings from sql-file into sets containing the attributes.

**Arguments**:

- `where_string_list`: A list of strings from the where clauses. These have to be separated into join- and
selection-attributes.

**Returns**:

A tuple containing the list of join-attributes in first and the list of selection-attributes in second
place.

<a name="query_parser.query_parser.QueryParser.csv_attribute_unpacker"></a>
#### csv\_attribute\_unpacker

```python
 | csv_attribute_unpacker(attribute_tuples: List[Tuple[str, str]], separator: str = ",") -> Tuple[List[str], List[str]]
```

Unpack the attribute strings from csv-file into sets containing the attributes.

**Arguments**:

- `attribute_tuples`: A list of tuples of strings where the first string is the string for all
join-attributes, while the second string contains all selection-attributes.
- `separator`: The column separator used in the file. You can use '\t' for .tsv files.

**Returns**:

A tuple containing the list of join-attributes in first and the list of selection-attributes in second
place.

<a name="query_parser.query_parser.QueryParser.save_solution_dict"></a>
#### save\_solution\_dict

```python
 | @staticmethod
 | save_solution_dict(solution_dict: Dict[int, Dict[str, List[str or Tuple[str, str]]]], save_file_path: str = "solution_dict")
```

Save the solution to file with specified filename.

**Arguments**:

- `solution_dict`: The dict containing the data to save.
- `save_file_path`: The path for the file in which the data should be saved. The .yaml ending is added
automatically.

<a name="query_parser.query_parser.QueryParser.run"></a>
#### run

```python
 | run(file_path: str, save_file_path: str, inner_separator: str = None, outer_separator: str = None, query_format: QueryFormat = QueryFormat.CROSS_PRODUCT) -> Dict[int, Dict[str, List[str or Tuple[str, str]]]]
```

Method for the whole parsing process.

**Arguments**:

- `file_path`: The file to read in which the sql-statements are saved.
- `save_file_path`: The path where to save the results.
- `inner_separator`: The column separator used in the file. You can use '\t' for .tsv files. -> See
documentation for details.
- `outer_separator`: The block separator used in the file. -> See documentation for details.
- `query_format`: The indicator for the format of the .sql query-file. If the given file is not .sql than
this is not used.

**Returns**:



<a name="vectorizer"></a>
# vectorizer

<a name="vectorizer.vectorizer"></a>
# vectorizer.vectorizer

<a name="vectorizer.vectorizer.Vectorizer"></a>
## Vectorizer Objects

```python
class Vectorizer()
```

Constructs a vector consisting of operator code and normalized value for each predicate in the sql query set
with set_query method.

<a name="vectorizer.vectorizer.Vectorizer.__init__"></a>
#### \_\_init\_\_

```python
 | __init__()
```

Intitialises the Vectorizer object by defining available operators.

<a name="vectorizer.vectorizer.Vectorizer.add_queries_with_cardinalities"></a>
#### add\_queries\_with\_cardinalities

```python
 | add_queries_with_cardinalities(queries_with_cardinalities_path: str)
```

Reads CSV file with format
(querySetID;query;encodings;max_card;min_max_step;estimated_cardinality;true_cardinality)
whereas min_max_step is an array of the format
[[1, 2, 1], [1, 113, 1], [1878, 2115, 1]] sorted by lexicographic order of corresponding predicates and
encodings is an empty array if only integer values are processed.
For a querySetID all predicates are collected and sorted in lexicographical order to provide correct indices
(e.g. in encodings & min_max_value) for a given predicate.
Read queries are added to the list of vectorisation tasks.

**Arguments**:

- `queries_with_cardinalities_path`: path to a CSV file containing all queries and their estimated and
true cardinalities

<a name="vectorizer.vectorizer.Vectorizer.vectorize"></a>
#### vectorize

```python
 | vectorize() -> List[np.array]
```

Vectorizes all vectorization tasks added.

**Returns**:

List of np.array vectors whereas each row contains the vectorized query and appended maximal,
estimated and true cardinality (in this order)

<a name="vectorizer.vectorizer.Vectorizer.save"></a>
#### save

```python
 | save(base_path: str, result_folder: str, base_filename: str, filetypes: str)
```

Stores the SQL query and corresponding vector at given path as NPY and TXT file.

**Arguments**:

- `base_path`: path to a directory for saving
- `result_folder`: name of folder to create for storing multiple files. This argument is seperated from
base_path to empathize the need for an extra folder, since multiple files are saved.
- `filename`: filename without filetype. querySetID is appended for differentiation
- `filetypes`: string of file types must contain "csv" or "npy"

<a name="vectorizer.vectorizer.vectorize_query_original"></a>
#### vectorize\_query\_original

```python
vectorize_query_original(query: str, min_max: Dict[str, Tuple[int, int, int]], encoders: List[Dict[str, int]]) -> np.array
```

Copy-pasted method of the original implementation for testing purposes; Only added Join detection

**Arguments**:

- `query`: the query to vectorize
- `min_max`: dictionary of all min, max, step values for each predicate
- `encoders`: dictionary, which maps predicates to encoders

**Returns**:

the normalized vector without cardinalities

<a name="vectorizer.vectorizer.vectorizer_tests"></a>
#### vectorizer\_tests

```python
vectorizer_tests()
```

Test method to compare the original implementation with jupyter notebook output (truth) or with the Vectorizer
implementation. Succeeds if no assertion throws an error.

