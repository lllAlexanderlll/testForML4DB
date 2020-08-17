<a name=".main"></a>
# main

<a name=".estimator"></a>
# estimator

<a name=".estimator.estimator"></a>
# estimator.estimator

<a name=".estimator.estimator.Estimator"></a>
## Estimator Objects

```python
class Estimator()
```

Class containing the neural network for cardinality estimation. The specifications of the neural network can be
changed in 'config.yaml'.

<a name=".estimator.estimator.Estimator.__init__"></a>
#### \_\_init\_\_

```python
 | __init__(config: Dict[str, Any] = None, config_file_path: str = "config.yaml", data: np.ndarray = None, model: Model = None, model_path: str = None, debug: bool = True)
```

Initializer for the Estimator.

Configuration options for the neural network are optionally passed via a config dict.
It must contain at least the fields "loss_function", "dropout", "learning_rate", "kernel_initializer",
"activation_strategy" and "layer".

@param config: Only used if neither a model or a model_path is passed.
    if given: It must contain at least the fields "loss_function", "dropout", "learning_rate",
    "kernel_initializer", "activation_strategy" and "layer".
    if not given: the config file 'config.yaml' is used for these settings.
@param config_file_path: path for the config-file -> only necessary if no config is given
@param data: Optional parameter for giving the data for training and testing. If given it has to be a Dict with
    at least "x" and "y" and optionally "postgres_estimate" as keys. The values have to be numpy.ndarray. For
    key "x" it should be the vectorized queries, for key "y" the true cardinalities in the same order and for
    optional key "postgres_estimate" the estimates of the postgres optimizer for the query.
@param model: Option to pass a Model which can be used.
@param model_path: Option to pass a path to a saved model in an .h5 file.
@param debug: Boolean whether to print additional information while processing.

<a name=".estimator.estimator.Estimator.get_model"></a>
#### get\_model

```python
 | get_model(len_input: int, override: bool = False) -> Model
```

Function for creating the model of the neural network with the information from self.config

@param len_input: The size of the input vector.
@param override: Whether an existing model should be overridden.
@return The model for the neural network with the given properties.

<a name=".estimator.estimator.Estimator.load_model"></a>
#### load\_model

```python
 | load_model(model_path: str)
```

Method for loading an already existing model wich was saved to file.

@param model_path: Path to the file containing the model to load

<a name=".estimator.estimator.Estimator.denormalize"></a>
#### denormalize

```python
 | @staticmethod
 | denormalize(y, y_min: float, y_max: float)
```

@param y: tensor filled with values to denormalize
@param y_min: minimum value for y
@param y_max: maximum value for y
@return tensor with denormalized values

<a name=".estimator.estimator.Estimator.denormalize_np"></a>
#### denormalize\_np

```python
 | @staticmethod
 | denormalize_np(y: np.ndarray, y_min: float, y_max: float) -> np.ndarray
```

@param y: numpy-array filled with values to denormalize
@param y_min: minimum value for y
@param y_max: maximum value for y
@return numpy-array with denormalized values

<a name=".estimator.estimator.Estimator.load_data_file"></a>
#### load\_data\_file

```python
 | load_data_file(file_path: str, override: bool = False) -> Dict[str, np.ndarray]
```

Method for loading the data from file.

@param file_path: Path for the file where the data is stored. Has to be a .csv or .npy file.
@param override: Boolean whether to override already existing data.
@return The data which is set for the Estimator.

<a name=".estimator.estimator.Estimator.set_data"></a>
#### set\_data

```python
 | set_data(loaded_data: np.ndarray, override: bool = False)
```

Method for setting data and dependent values like max_card and input_length.

@param loaded_data: The data loaded from the file.
@param override: Boolean whether to override already existing data.

<a name=".estimator.estimator.Estimator.split_data"></a>
#### split\_data

```python
 | split_data(split: float = 0.9)
```

Function to split the data into training- and test-set by a parameterized split value.

@param split: Percentage of the data going into training set. (split=0.9 means 90% of data is training set)

<a name=".estimator.estimator.Estimator.train"></a>
#### train

```python
 | train(epochs: int = 100, verbose: int = 1, shuffle: bool = True, batch_size: int = 32, validation_split: float = 0.1) -> Union[History, History]
```

Method for training the before created Model.

@param epochs: Number of epochs for training.
@param verbose: How much information to print while training. 0 = silent, 1 = progress bar, 2 = one line per
    epoch.
@param shuffle: Whether to shuffle the training data -> not necessary if split was done by numpy.random.choice()
@param batch_size: Size for the batches -> Smaller batches may be able to train the neural network better
    (possibly) but enlarge training time, while bigger batches may lead to a less well trained network while
    training faster.
@param validation_split: How much of the data should be taken as validation set -> these are taken from the
    training data, not the test data, and are reselected for every epoch.
@return Training history as dict.

<a name=".estimator.estimator.Estimator.test"></a>
#### test

```python
 | test() -> np.ndarray
```

Let the trained neural network predict the test data.

@return numpy-array containing the normalized predictions of the neural network for the test data

<a name=".estimator.estimator.Estimator.predict"></a>
#### predict

```python
 | predict(data: np.ndarray) -> np.ndarray
```

Let the trained neural network predict the given data.

@param data: numpy-array containing at least one vectorized query which should be predicted
@return numpy-array containing the normalized predictions of the neural network for the given data

<a name=".estimator.estimator.Estimator.run"></a>
#### run

```python
 | run(data_file_path: str = None, epochs: int = 100, verbose: int = 1, shuffle: bool = True, batch_size: int = 32, validation_split: float = 0.1, override_model: bool = False, save_model: bool = True, save_model_file_path: str = "model") -> np.ndarray
```

Method for a full run of the Estimator, with training and testing.

@param data_file_path: Optional path to saved data file. Only necessary if no data has been set before.
@param epochs: Number of epochs for training.
@param verbose: How much information to print while training. 0 = silent, 1 = progress bar, 2 = one line per
    epoch.
@param shuffle: Whether to shuffle the training data -> not necessary if split was done by numpy.random.choice()
@param batch_size: Size for the batches -> Smaller batches may be able to train the neural network better
    (possibly) but enlarge training time, while bigger batches may lead to a less well trained network while
    training faster.
@param validation_split: How much of the data should be taken as validation set -> these are taken from the
    training data, not the test data, and are reselected for every epoch.
@param override_model: Whether to override a probably already existing model.
@param save_model: Whether to save the trained model to file.
@param save_model_file_path: When save_model==True this parameter is required to give the path where the model
    should be saved.
@return A numpy.ndarray containing the calculated q-error.

<a name=".estimator.estimator.Estimator.save_model"></a>
#### save\_model

```python
 | save_model(filename: str = "model")
```

Method for saving the Model to file.

@param filename: Name of the file where the model should be stored. (Without file ending. ".h5" is added to the
    filename)

<a name=".vectorizer"></a>
# vectorizer

<a name=".vectorizer.vectorizer"></a>
# vectorizer.vectorizer

<a name=".vectorizer.vectorizer.Vectorizer"></a>
## Vectorizer Objects

```python
class Vectorizer()
```

Constructs a vector consisting of operator code and normalized value for each predicate in the sql query set
with set_query method.

<a name=".vectorizer.vectorizer.Vectorizer.__init__"></a>
#### \_\_init\_\_

```python
 | __init__()
```

Intitialises the Vectorizer object by defining available operators.

<a name=".vectorizer.vectorizer.Vectorizer.add_queries_with_cardinalities"></a>
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

@param queries_with_cardinalities_path: path to a CSV file containing all queries and their estimated and 
true cardinalities

<a name=".vectorizer.vectorizer.Vectorizer.vectorize"></a>
#### vectorize

```python
 | vectorize() -> List[np.array]
```

Vectorizes all vectorization tasks added.

@return List of np.array vectors whereas each row contains the vectorized query and appended maximal,
     estimated and true cardinality (in this order)

<a name=".vectorizer.vectorizer.Vectorizer.save"></a>
#### save

```python
 | save(base_path: str, result_folder: str, base_filename: str, filetypes: str)
```

Stores the SQL query and corresponding vector at given path as NPY and TXT file.

@param base_path: path to a directory for saving
@param result_folder: name of folder to create for storing multiple files. This argument is seperated from 
    base_path to empathize the need for an extra folder, since multiple files are saved.
@param filename: filename without filetype. querySetID is appended for differentiation
@param filetypes: string of file types must contain "csv" or "npy"

<a name=".vectorizer.vectorizer.vectorize_query_original"></a>
#### vectorize\_query\_original

```python
vectorize_query_original(query: str, min_max: Dict[str, Tuple[int, int, int]], encoders: List[Dict[str, int]]) -> np.array
```

Copy-pasted method of the original implementation for testing purposes; Only added Join detection

@param query: the query to vectorize
@param min_max: dictionary of all min, max, step values for each predicate
@param encoders: dictionary, which maps predicates to encoders
@return the normalized vector without cardinalities

<a name=".vectorizer.vectorizer.vectorizer_tests"></a>
#### vectorizer\_tests

```python
vectorizer_tests()
```

Test method to compare the original implementation with jupyter notebook output (truth) or with the Vectorizer
implementation. Succeeds if no assertion throws an error.

