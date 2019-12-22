# What to do When Machine Learning


"The Universal workflow of machine learning"



## Defining the problem and assembling a dataset

- What will your input data be? What are you trying to predict? You can only learn to predict something if you have available training data.

- What type of problem are you facing? Is it binary classification? Multiclass classification? Scalar regression? Vector regression? Multiclass, multilabel classification? Something else, like clustering, generation, or reinforcement learning?


- You hypothesize that your outputs can be predicted given your inputs.
- You hypothesize that your available data is sufficiently informative to learn the relationship between inputs and outputs.

> Keep in mind that machine learning can only be used to memorize patterns that
are present in your training data. You can only recognize what you’ve seen before.
Using machine learning trained on past data to predict the future is making the
assumption that the future will behave like the past. That often isn’t the case. 

### Choosing a measure of success

To control something, you need to be able to observe it. To achieve success, you must
define what you mean by success—accuracy? Precision and recall? Customer-retention
rate? Your metric for success will guide the choice of a loss function: what your model
will optimize. It should directly align with your higher-level goals, such as the success
of your business.

For balanced-classification problems, where every class is equally likely, accuracy and
area under the receiver operating characteristic curve (ROC AUC) are common metrics. For
class-imbalanced problems, you can use precision and recall. For ranking problems or
multilabel classification, you can use mean average precision. And it isn’t uncommon
to have to define your own custom metric by which to measure success. 

>  To get a sense
of the diversity of machine-learning success metrics and how they relate to different
problem domains, it’s helpful to browse the data science competitions on Kaggle
(https://kaggle.com); they showcase a wide range of problems and evaluation metrics.

### Deciding on an evaluation protocol

- Maintaining a hold-out validation set—The way to go when you have plenty of data
- Doing K-fold cross-validation—The right choice when you have too few samples for hold-out validation to be reliable
- Doing iterated K-fold validation—For performing highly accurate model evaluation when little data is available


### Preparing Data

You should
format your data in a way that can be fed into a machine-learning model:
- your data should be formatted as tensors.
- The values taken by these tensors should usually be scaled to small values: for example, in the [-1, 1] range or [0, 1] range.
- If different features take values in different ranges (heterogeneous data), then the data should be normalized.
- You may want to do some feature engineering, especially for small-data problems.



## Developing a model that does better than a baseline

Your goal at this stage is to achieve statistical power: that is, to develop a small model
that is capable of beating a dumb baseline.

Note that it’s not always possible to achieve statistical power. If you can’t beat a random baseline after trying multiple reasonable architectures, it may be that the answer
to the question you’re asking isn’t present in the input data. Remember that you make
two hypotheses:
- You hypothesize that your outputs can be predicted given your inputs.
- You hypothesize that the available data is sufficiently informative to learn the relationship between inputs and outputs.

 Assuming that things go well, you need to make three key choices to build your
first working model:
- Last-layer activation—This establishes useful constraints on the network’s output. For instance, the IMDB classification example used sigmoid in the last layer; the regression example didn’t use any last-layer activation; and so on.
- Loss function—This should match the type of problem you’re trying to solve. For instance, the IMDB example used binary_crossentropy, the regression example used mse, and so on.
- Optimization configuration—What optimizer will you use? What will its learning rate be? In most cases, it’s safe to go with rmsprop and its default learning rate.

![](img/modelparam.PNG)

## Scaling up: developing a model that overfits

Once you’ve obtained a model that has statistical power, the question becomes, is your
model sufficiently powerful? Does it have enough layers and parameters to properly
model the problem at hand? For instance, a network with a single hidden layer with
two units would have statistical power on MNIST but wouldn’t be sufficient to solve the
problem well. Remember that the universal tension in machine learning is between
optimization and generalization; the ideal model is one that stands right at the border
between underfitting and overfitting; between undercapacity and overcapacity. To figure out where this border lies, first you must cross it.

To develop a model that overfits:

1. Add layers.
2. Make the layers bigger.
3. Train for more epochs.

## Regularizing your model and tuning your hyperparameters

This step will take the most time: you’ll repeatedly modify your model, train it, evaluate on your validation data (not the test data, at this point), modify it again, and
repeat, until the model is as good as it can get. These are some things you should try:

- Add dropout.
- Try different architectures: add or remove layers.
- Add L1 and/or L2 regularization.
- Try different hyperparameters (such as the number of units per layer or the learning rate of the optimizer) to find the optimal configuration.
- Optionally, iterate on feature engineering: add new features, or remove features that don’t seem to be informative

> Be mindful of the following: every time you use feedback from your validation process
to tune your model, you leak information about the validation process into the model.
Repeated just a few times, this is innocuous; but done systematically over many iterations, it will eventually cause your model to overfit to the validation process (even
though no model is directly trained on any of the validation data). This makes the
evaluation process less reliable.



## Summary

- Define the problem at hand and the data on which you’ll train. Collect this data, or annotate it with labels if need be.
- Choose how you’ll measure success on your problem. Which metrics will you monitor on your validation data?
- Determine your evaluation protocol: hold-out validation? K-fold validation? Which portion of the data should you use for validation?
- Develop a first model that does better than a basic baseline: a model with statistical power.
- Develop a model that overfits.
- Regularize your model and tune its hyperparameters, based on performance on the validation data. A lot of machine-learning research tends to focus only on this step—but keep the big picture in mind.


```python

```
