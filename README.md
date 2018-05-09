# Meachine Learning

Content
=======

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

1. [Git | Gitbook](https://www.gitbook.com/book/zlargon/git-tutorial/details)

### R

1. [Install R and Python via Homebrew](http://pacha.hk/2017-07-12_r_and_python_via_homebrew.html)

### Tensorflow

1. tfbuild.sh 檔案，用於自動編譯 Tensorflow source code for Mac/Linux, 去除不支援處理器命令集的警告提示。
2. [Tensorflow from Beginning](https://cigoic.wordpress.com/2017/07/26/tensorflow-from-beginning-2/)
3. 2018 [CS20SI - Stanford University: Tensorflow for Deep Learning Research](https://web.stanford.edu/class/cs20si)

### Python

1. [Kaggle's Official Tutor series- Hands-On Data Science Education](https://www.kaggle.com/learn/overview)
2. [matplotlib: RuntimeError: Python is not installed as a framework](https://stackoverflow.com/questions/34977388/matplotlib-runtimeerror-python-is-not-installed-as-a-framework)

### Machine Learning

1. [Google - Machine Learning Crash Course](https://developers.google.com/machine-learning/crash-course/)
2. [Google 數位學程](https://learndigital.withgoogle.com/digitalgarage-tw)
3. [Deep Learning Resources](https://cigoic.wordpress.com/2017/07/28/deep-learning-resources/)

### Case Study

	@Kaggle

	* Dogs and Cats - binary classification
	* Titanic
	* Melbourne Housing Snapshot
	* Housing Price: Advanced Regression Techniques
	* Data Science London + Scikit-learn
