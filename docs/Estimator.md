# Estimator


Class containing the neural network for cardinality estimation. The specifications of the neural network can be changed in 'config.yaml'. 

## Methods


### __init__


Initializer for the Estimator.   
Configuration options for the neural network are optionally passed via a config dict. It must contain at least the fields "loss_function", "dropout", "learning_rate", "kernel_initializer", "activation_strategy" and "layer".   


#### Parameters
name | description | default
--- | --- | ---
config: | Only used if neither a model or a model_path is passed. if given: It must contain at least the fields "loss_function", "dropout", "learning_rate", "kernel_initializer", "activation_strategy" and "layer". if not given: the config file 'config.yaml' is used for these settings. | 
config_file_path: | path for the config-file -> only necessary if no config is given | 
data: | Optional parameter for giving the data for training and testing. If given it has to be a Dict with at least "x" and "y" and optionally "postgres_estimate" as keys. The values have to be numpy.ndarray. For key "x" it should be the vectorized queries, for key "y" the true cardinalities in the same order and for optional key "postgres_estimate" the estimates of the postgres optimizer for the query. | 
model: | Option to pass a Model which can be used. | 
model_path: | Option to pass a path to a saved model in an .h5 file. | 
debug: | Boolean whether to print additional information while processing. | 
self |  | 
config |  | None
config_file_path |  | "config.yaml"
data |  | None
model |  | None
model_path |  | None
debug |  | True





### get_model


Function for creating the model of the neural network with the information from self.config   


#### Parameters
name | description | default
--- | --- | ---
len_input: | The size of the input vector. | 
override: | Whether an existing model should be overridden. | 
self |  | 
len_input |  | 
override |  | False





### load_model


Method for loading an already existing model wich was saved to file.   


#### Parameters
name | description | default
--- | --- | ---
model_path: | Path to the file containing the model to load | 
self |  | 
model_path |  | 





### denormalize




#### Parameters
name | description | default
--- | --- | ---
y: | tensor filled with values to denormalize | 
y_min: | minimum value for y | 
y_max: | maximum value for y | 
y |  | 
y_min |  | 
y_max |  | 





### denormalize_np




#### Parameters
name | description | default
--- | --- | ---
y: | numpy-array filled with values to denormalize | 
y_min: | minimum value for y | 
y_max: | maximum value for y | 
y |  | 
y_min |  | 
y_max |  | 





### q_loss




#### Parameters
name | description | default
--- | --- | ---
self |  | 
y_true |  | 
y_pred |  | 





### q_loss_np




#### Parameters
name | description | default
--- | --- | ---
self |  | 
y_true |  | 
y_pred |  | 





### load_data_file


Method for loading the data from file.   


#### Parameters
name | description | default
--- | --- | ---
file_path: | Path for the file where the data is stored. Has to be a .csv or .npy file. | 
override: | Boolean whether to override already existing data. | 
self |  | 
file_path |  | 
override |  | False





### set_data


Method for setting data and dependent values like max_card and input_length.   


#### Parameters
name | description | default
--- | --- | ---
loaded_data: | The data loaded from the file. | 
override: | Boolean whether to override already existing data. | 
self |  | 
loaded_data |  | 
override |  | False





### split_data


Function to split the data into training- and test-set by a parameterized split value.   


#### Parameters
name | description | default
--- | --- | ---
split: | Percentage of the data going into training set. (split=0.9 means 90% of data is training set) | 
self |  | 
split |  | 0.9





### train


Method for training the before created Model.   


#### Parameters
name | description | default
--- | --- | ---
epochs: | Number of epochs for training. | 
verbose: | How much information to print while training. 0 = silent, 1 = progress bar, 2 = one line per epoch. | 
shuffle: | Whether to shuffle the training data -> not necessary if split was done by numpy.random.choice() | 
batch_size: | Size for the batches -> Smaller batches may be able to train the neural network better (possibly) but enlarge training time, while bigger batches may lead to a less well trained network while training faster. | 
validation_split: | How much of the data should be taken as validation set -> these are taken from the training data, not the test data, and are reselected for every epoch. | 
self |  | 
epochs |  | 100
verbose |  | 1
shuffle |  | True
batch_size |  | 32
validation_split |  | 0.1





### test


Let the trained neural network predict the test data.   


#### Parameters
name | description | default
--- | --- | ---
self |  | 





### predict


Let the trained neural network predict the given data.   


#### Parameters
name | description | default
--- | --- | ---
data: | numpy-array containing at least one vectorized query which should be predicted | 
self |  | 
data |  | 





### run


Method for a full run of the Estimator, with training and testing.   


#### Parameters
name | description | default
--- | --- | ---
data_file_path: | Optional path to saved data file. Only necessary if no data has been set before. | 
epochs: | Number of epochs for training. | 
verbose: | How much information to print while training. 0 = silent, 1 = progress bar, 2 = one line per epoch. | 
shuffle: | Whether to shuffle the training data -> not necessary if split was done by numpy.random.choice() | 
batch_size: | Size for the batches -> Smaller batches may be able to train the neural network better (possibly) but enlarge training time, while bigger batches may lead to a less well trained network while training faster. | 
validation_split: | How much of the data should be taken as validation set -> these are taken from the training data, not the test data, and are reselected for every epoch. | 
override_model: | Whether to override a probably already existing model. | 
save_model: | Whether to save the trained model to file. | 
save_model_file_path: | When save_model==True this parameter is required to give the path where the model should be saved. | 
self |  | 
data_file_path |  | None
epochs |  | 100
verbose |  | 1
shuffle |  | True
batch_size |  | 32
validation_split |  | 0.1
override_model |  | False
save_model |  | True
save_model_file_path |  | "model"





### save_model


Method for saving the Model to file.   


#### Parameters
name | description | default
--- | --- | ---
filename: | Name of the file where the model should be stored. (Without file ending. ".h5" is added to the filename) | 
self |  | 
filename |  | "model"




