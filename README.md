# Meachine Learning

Content
=======

Folers/Files:

	src_samples		- 內有各式 Neural Network 模型範例
	  |
	  >> tf2		- 適用於 Tensorflow 2.0 的範例
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

### 統計學 Statistics

* 交通大學開放式課程 - 管理學院 - 唐麗英 - [統計學(一)：基礎統計學](http://ocw.nctu.edu.tw/course_detail.php?bgid=3&gid=0&nid=454)
* 交通大學開放式課程 - 管理學院 - 唐麗英 - [統計學(二)：進階統計](http://ocw.nctu.edu.tw/course_detail.php?bgid=3&gid=0&nid=511)

### Python

* [Kaggle | Learn Python Challenge series](https://www.kaggle.com/colinmorris/learn-python-challenge-day-5)
* [Kaggle's Official Tutor series- Hands-On Data Science Education](https://www.kaggle.com/learn/overview)

### Tensorflow 2.x

* 教學 [Udacity | Tensorflow free course](https://classroom.udacity.com/courses/ud187)
* 教學 [Coursera | Introduction to TensorFlow for Artificial Intelligence, Machine Learning, and Deep Learning](https://www.coursera.org/learn/introduction-tensorflow)
* 教學 [Coursera | Convolutional Neural Networks in TensorFlow](https://www.coursera.org/learn/convolutional-neural-networks-tensorflow)

### Tensorflow 1.x

* 教學 [Udemy | Complete Guide to TensorFlow for Deep Learning with Python](https://www.udemy.com/complete-guide-to-tensorflow-for-deep-learning-with-python/)
* [Data Flair | Tensorflow Tutorial](https://data-flair.training/blogs/tensorflow-tutorial/)

###### w/ Scikit-Learn (Optional)

* Book [O'Reilly | Hands-on Machine Learning with Scikit-Learn and TensorFlow](http://shop.oreilly.com/product/0636920052289.do)
	* [GitHub (相當實用的範例)](https://github.com/ageron/handson-ml)

### Machine Learning

* Coursera | [Machine Learning](https://www.coursera.org/learn/machine-learning)
* Coursera | [Deep Learning](https://www.coursera.org/specializations/deep-learning)
* [Google - Machine Learning Crash Course](https://developers.google.com/machine-learning/crash-course/)
* [Google 數位學程](https://learndigital.withgoogle.com/digitalgarage-tw)
* [Bloomberg 機器學習視訊課程](https://bloomberg.github.io/foml/)
* [Deep Learning Resources](https://cigoic.wordpress.com/2017/07/28/deep-learning-resources/)

###### @Google Cloud Platfrom (GCP)
* Coursera | [Machine Learning with TensorFlow on Google Cloud Platform] (https://www.coursera.org/specializations/machine-learning-tensorflow-gcp)
* Coursera | [Advanced Machine Learning with TensorFlow on Google Cloud Platform](https://www.coursera.org/specializations/advanced-machine-learning-tensorflow-gcp)
* Coursera | [Data Engineering on Google Cloud Platform Specialization](https://www.coursera.org/specializations/gcp-data-machine-learning)

###### 視覺系輕鬆讀：

* [100 Days of Machine Learning](https://github.com/Avik-Jain/100-Days-Of-ML-Code)
* [簡中版| 100 Days of Machine Learning](https://github.com/MachineLearning100/100-Days-Of-ML-Code)
* [Andrew Ng's Deep Learning Notes - Unofficial version](https://www.slideshare.net/TessFerrandez/notes-from-coursera-deep-learning-courses-by-andrew-ng)

### R (Optional)

* [Install R and Python via Homebrew](http://pacha.hk/2017-07-12_r_and_python_via_homebrew.html)

### Study Plan for a beginner

* Get familiar with Python, Numpy, Pandas, Matplotlib and Kaggle. ==> Start from [Offical Kaggle Tutor series](https://www.kaggle.com/learn/overview).
* [JupyterNotebook - Pandas Tutor](https://github.com/ageron/handson-ml/blob/master/tools_pandas.ipynb)
* [JupyterNotebook - Numpy Tutor](https://github.com/ageron/handson-ml/blob/master/tools_numpy.ipynb)
* [JupyterNotebook - Matplotlib Tutor](https://github.com/ageron/handson-ml/blob/master/tools_matplotlib.ipynb)
* [JupyterNotebook - Linear Algebra](https://github.com/ageron/handson-ml/blob/master/math_linear_algebra.ipynb)

### Case Study

* The University of Massachusetts Amherst: www.umass.edu/statdata/statdata.
* Kaggle 包含所有類型的大型數據: www.kaggle.com/datasets.
* Data.gov is an open data initiative by the US government: https://catalog.data.gov.

###### For Classification

*  Large Movie Review Dataset: http://mng.bz/60nj
*  Sentiment Labelled Sentences Data Set: http://mng.bz/CzSM
*  Twitter Sentiment Analysis Dataset: http://mng.bz/2M4d
