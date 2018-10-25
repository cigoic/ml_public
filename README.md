# Meachine Learning

Content
=======

Folers/Files:

	src_samples		- 內有各式 Neural Network 模型範例
	basics_of_ml.ipynb	- 解說機器學習的基本觀念
	about_tensorflow.ipynb	- 簡述 Tensorflow 基本知識
	tfbuild.sh 		- 用於自動編譯 Tensorflow source code for Mac, 可去除不支援處理器命令集的警告提示。
	tfbuild-gpu.sh		- 同上, 編譯 GPU 版 Tensorflow


### GPU Usage Note

For Multiple GPUs, Please use the following commends to specify GPU ID:

```
@Terminal
Export CUDA_VISIBLE_DEVICES to your shell .rc file. (Do it once!!)
	$ echo CUDA_VISIBLE_DEVICES=0 >> ~/.bashrc

or 
	$ CUDA_VISIBLE_DEVICES=0 python <your_script>.py
```

```
@Python script
	import os
	os.environ['CUDA_VISIBLE_DEVICES'] = str(0)
```

```
@Jupyter notebook
At beginning:

	%env CUDA_VISIBLE_DEVICES=0

At the end: (Release resources)

%%javascript
Jupyter.notebook.session.delete()
```

### RC Files for BASH, VIM
### Git

* [Git | Gitbook](https://www.gitbook.com/book/zlargon/git-tutorial/details)

### R

* [Install R and Python via Homebrew](http://pacha.hk/2017-07-12_r_and_python_via_homebrew.html)

### Tensorflow

* 安裝/編譯：[Tensorflow from Beginning](https://cigoic.wordpress.com/2017/07/26/tensorflow-from-beginning-2/)
* 安裝/編譯 Intel 最佳化版本: [Intel® Optimization for TensorFlow* Installation Guide | Intel® Software](https://software.intel.com/en-us/articles/intel-optimization-for-tensorflow-installation-guide)
* [Data Flair | Tensorflow Tutorial](https://data-flair.training/blogs/tensorflow-tutorial/)
* 教學 [2018 CS20SI - Stanford University: Tensorflow for Deep Learning Research](https://web.stanford.edu/class/cs20si)
* 教學 [Applied Deep Learning with TensorFlow and Google Cloud AI](https://www.packtpub.com/mapt/video/big_data_and_business_intelligence/9781788621601)

###### w/ Scikit-Learn

* Book [O'Reilly | Hands-on Machine Learning with Scikit-Learn and TensorFlow](http://shop.oreilly.com/product/0636920052289.do)
	* [GitHub (相當實用的範例)](https://github.com/ageron/handson-ml)

### Python

* [Learning Python](http://learnpython.org)
* [Kaggle | Learn Python Challenge series](https://www.kaggle.com/colinmorris/learn-python-challenge-day-5)
* [Kaggle's Official Tutor series- Hands-On Data Science Education](https://www.kaggle.com/learn/overview)
* [matplotlib: RuntimeError: Python is not installed as a framework](https://stackoverflow.com/questions/34977388/matplotlib-runtimeerror-python-is-not-installed-as-a-framework)

### Machine Learning

* [Coursera | Machine Learning](https://www.coursera.org/learn/machine-learning)
* [Coursera | Deep Learning](https://www.coursera.org/specializations/deep-learning)
* [Google - Machine Learning Crash Course](https://developers.google.com/machine-learning/crash-course/)
* [Google 數位學程](https://learndigital.withgoogle.com/digitalgarage-tw)
* [Bloomberg 機器學習視訊課程](https://bloomberg.github.io/foml/)
* [Deep Learning Resources](https://cigoic.wordpress.com/2017/07/28/deep-learning-resources/)

###### @Google Cloud Platfrom (GCP)
* [2018 Coursera | Machine Learning with TensorFlow on Google Cloud Platform] (https://www.coursera.org/specializations/machine-learning-tensorflow-gcp)
* [2018 Coursera | Advanced Machine Learning with TensorFlow on Google Cloud Platform](https://www.coursera.org/specializations/advanced-machine-learning-tensorflow-gcp)
* [Coursera | Data Engineering on Google Cloud Platform Specialization](https://www.coursera.org/specializations/gcp-data-machine-learning)

###### 視覺系輕鬆讀：

* [100 Days of Machine Learning](https://github.com/Avik-Jain/100-Days-Of-ML-Code)
* [簡中版| 100 Days of Machine Learning](https://github.com/MachineLearning100/100-Days-Of-ML-Code)
* [Andrew Ng's Deep Learning Notes - Unofficial version](https://www.slideshare.net/TessFerrandez/notes-from-coursera-deep-learning-courses-by-andrew-ng)

### Study Plan for a beginner

For Programming Skill:

* Get familiar with Python, Numpy, Pandas, Matplotlib and Kaggle. ==> Start from [Offical Kaggle Tutor series](https://www.kaggle.com/learn/overview).
* [JupyterNotebook - Pandas Tutor](https://github.com/ageron/handson-ml/blob/master/tools_pandas.ipynb)
* [JupyterNotebook - Numpy Tutor](https://github.com/ageron/handson-ml/blob/master/tools_numpy.ipynb)
* [JupyterNotebook - Matplotlib Tutor](https://github.com/ageron/handson-ml/blob/master/tools_matplotlib.ipynb)
* [JupyterNotebook - Linear Algebra](https://github.com/ageron/handson-ml/blob/master/math_linear_algebra.ipynb)
* Try out Kaggle's [Titanic Competition Python Tutorials](http://www.kaggle.com/c/titanic-gettingStarted)
* Linear Regression/Logistic Regression/Classification - Try exapmples from [Machine Learning with Tensorflow ebook](https://github.com/BinRoot/TensorFlow-Book)
* Natural Language Problem (NLP) - try out Kaggle's [Bag of Words Meets Bags of Popcorn](https://www.kaggle.com/c/word2vec-nlp-tutorial/overview)

### Case Study

###### @Kaggle

* Dogs and Cats - binary classification
* Titanic
* Melbourne Housing Snapshot
* Housing Price: Advanced Regression Techniques
* Data Science London + Scikit-learn
    
###### For Linear Regression

* The University of Massachusetts Amherst: www.umass.edu/statdata/statdata.
* Kaggle 包含所有類型的大型數據: www.kaggle.com/datasets.
* Data.gov is an open data initiative by the US government: https://catalog.data.gov.

###### For Classification

*  Large Movie Review Dataset: http://mng.bz/60nj
*  Sentiment Labelled Sentences Data Set: http://mng.bz/CzSM
*  Twitter Sentiment Analysis Dataset: http://mng.bz/2M4d
