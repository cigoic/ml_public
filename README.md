# Meachine Learning

Content
=======

Folers/Files:

	src_samples		- 內有各式 Neural Network 模型範例
	basics_of_ml.ipynb	- 解說機器學習的基本觀念
	about_tensorflow.ipynb	- 簡述 Tensorflow 基本知識
	tfbuild.sh 		- 用於自動編譯 Tensorflow source code for Mac, 可去除不支援處理器命令集的警告提示。


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
* 教學 [2018 CS20SI - Stanford University: Tensorflow for Deep Learning Research](https://web.stanford.edu/class/cs20si)

### Python

* [Kaggle's Official Tutor series- Hands-On Data Science Education](https://www.kaggle.com/learn/overview)
* [matplotlib: RuntimeError: Python is not installed as a framework](https://stackoverflow.com/questions/34977388/matplotlib-runtimeerror-python-is-not-installed-as-a-framework)

### Machine Learning

* [Google - Machine Learning Crash Course](https://developers.google.com/machine-learning/crash-course/)
* [Google 數位學程](https://learndigital.withgoogle.com/digitalgarage-tw)
* [Deep Learning Resources](https://cigoic.wordpress.com/2017/07/28/deep-learning-resources/)

### Case Study

	@Kaggle

	* Dogs and Cats - binary classification
	* Titanic
	* Melbourne Housing Snapshot
	* Housing Price: Advanced Regression Techniques
	* Data Science London + Scikit-learn
    
    For Linear Regression
    
    * The University of Massachusetts Amherst: www.umass.edu/statdata/statdata.
    * Kaggle 包含所有類型的大型數據: www.kaggle.com/datasets.
    * Data.gov is an open data initiative by the US government: https://catalog.data.gov.

    For Classification

    *  Large Movie Review Dataset: http://mng.bz/60nj
    *  Sentiment Labelled Sentences Data Set: http://mng.bz/CzSM
    *  Twitter Sentiment Analysis Dataset: http://mng.bz/2M4d
