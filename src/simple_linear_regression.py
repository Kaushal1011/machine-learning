#!/usr/bin/env python3
'''
Performing Simple Linear Regression
https://github.com/dhruvildave
Thu Oct 17 14:00:50 IST 2019
'''

import numpy as np
import pandas as pd
import sklearn.linear_model as lm


def main() -> None:
    '''Driver code'''

    # Reading the advertising dataset
    adv = pd.read_csv('../datasets/Advertising.csv')

    # Dropping the first column of index
    adv.drop(columns=['Unnamed: 0'], inplace=True)

    # Reading the required columns
    X = adv['TV']
    Y = adv['sales']

    # Converting pandas Series to numpy ndarray
    X = np.array(X).reshape((-1, 1))
    Y = np.array(Y).reshape((-1, 1))

    # Fitting the linear model
    fit = lm.LinearRegression().fit(X, Y)

    print('Intercept == {}'.format(fit.intercept_))
    print('Slope == {}'.format(fit.coef_))
    print('Multiple R^2 == {}'.format(fit.score(X, Y)))


if __name__ == '__main__':
    main()
