---
layout: post # Use the new post layout
title: 10 lessons from Machine Learning in a start-up
date: 2021-12-16
author: Yogendra Miraje # Optional: Add author
---

<p><a href="{{ '/blog' | relative_url }}">← Back to Blog</a></p>

<div class="post-content">
  <p>The power of machine learning has been recognized by big tech companies way before it became mainstream. With the copious amount of data, cutting-edge infrastructure and algorithms, and the right talent, these companies were able to capitalize and ride on the wave of machine learning in the last decade.</p>

  <p>Start-ups and small companies have also been catching up with this wave in the last few years. With the ease of using machine learning through the ecosystem of ML algorithms, libraries, tools, and communities startups are in a much better position than ever to build and deploy models to solve their niche business problems.</p>

  <p>With the democratization of machine learning across hardware and software, the success of an ML model (in my humble opinion) boils down mostly to the "Data" component. However, still today most of the ML models never see the light of the day and rest in a piece in Jupyter notebooks, and data is not the only culprit here.</p>

  <p>Following are 10 lessons I learned in developing and deploying ML models in a startup. To be honest — the title is clickbaity and there is no reason why these lessons won't apply in the non-startup scenarios where you are just starting with ML.</p>

  <h3>Assess and pick the right use-case</h3>
  <p>Most of the time need for an ML-based solution arises from a business problem or a technical problem engineer is trying to solve. No matter who comes up with a use-case, it's important to be critical about the need of using ML for the problem. Will you use a sword if the job can be done with a swiss-knife? I hope not unless you want to exhaust yourself in the process.</p>

  <p>Please don't use machine learning just for the sake of using it. The downsides of maintaining an unnecessary ML model could outweigh all the benefits it can provide. Investing in a machine learning technology could be demanding, and not worth it if your requirements are satisfied with non-ML solutions.</p>

  <p>On the other hand, If your problem genuinely requires a machine learning-based solution, it is definitely rewarding in the long run. In this case, start with a simple and clear use-case. This will boost the chances of implementing the model successfully and demonstrating the power of ML in your first attempt.</p>

  <blockquote>Start with a simple and clear use-case.</blockquote>

  <p>For example — Let's say you work in a News-feed startup that recommends the news as per the user's interest and you need to classify the types of news in your database. Don't pick a 100-class classification model as your first battle, but rather go for a simple and neat 5-class classification problem to bucket your news into Politics, Sports, Technology, Finance, and Others.</p>

  <h3>Get stakeholders in confidence</h3>
  <p>Who are the stakeholders? It could be anyone who is relying on the success of your model. Product Managers, Technical Managers, Data Analysts, or Business folks. Talk to them in a very early stage and understand the business problem clearly, especially, if they are the ones who will make a final call on deploying the model in the production.</p>

  <p>Set the right and reasonable expectations up front. Agree on a precise number for the performance metric you choose. If they are unable to decide on it, help them or set it yourself and communicate it in a language they understand.</p>
  <blockquote>The model will be deployed if it's 85% accurate meaning it will be right on 85 times out of 100 on average.</blockquote>

  <p>Encourage them to learn about machine learning and what it can do. Andrew Ng's AI for everyone is a great starting point.</p>

  <blockquote>Agree on a precise number for the performance metric</blockquote>

  <h3>Gather as much as possible [clean] data</h3>
  <p>One of the hardest problems for startup or niche business cases is getting the training data. Unfortunately, there are no shortcuts here. You have to get it in order to start working on your ML model. You can be creative (more on that in the next part), if you don't have a lot of labeled data, but you need something, to begin with.</p>

  <p><em>How many labeled instances I will need?</em></p>
  <p>Unfortunately, there is no easy answer for this either. There are some ways you can try to estimate the minimum amount of data you need to meet your performance requirements. But the short answer is — get as much as you can ! The amount of labeled data you can get is often constrained by the budget set for the resources required for labeling.</p>

  <p>It's not enough to have enough data. You should aim for clean data with the least noise possible. Nothing can explain it better than the classic ML proverb — Garbage in Garbage out. Look for inconsistencies in the labels which could be detrimental to your model. Make your labelers efficient with a clean design to remove the decision fatigue. Give all the information they need to label accurately. This will boost the accuracy and consistency of the labels.</p>

  <blockquote>Look for inconsistencies in the labels</blockquote>

  <h3>Be creative with small amounts of data</h3>
  <p>Big tech companies get data on a scale of millions or even billions of instances. This immensely increases the likelihood of the success of the model as neural networks are data-hungry beasts. A startup often doesn't have this luxury of data abundance.</p>

  <p>If you have to work with a few hundred or a few thousand instances, there are some ways you can make it work :</p>

  <ul>
    <li>Use Transfer Learning and fine-tune the large models on your small datasets<br>This has gained a lot of traction lately and proved to be very useful in practice.</li>
    <li>Use Active Learning to select the data instances for the training<br>This is still an emerging field but could be a handy technique if it works for you.</li>
    <li>Use data augmentation to get more instances<br>Image classification could gain significantly from this technique, success with NLP augmentation is limited, at least from what I have seen.</li>
  </ul>

  <h3>Start with simple algorithms</h3>
  <p>When you have got your data cleaned, preprocessed, and you are all set for embarking on an experimentation journey, it's time to choose algorithms.</p>
  <p><em>Which one should I start with?</em></p>
  <p>Go with the simplest of all algorithms or if you can't decide the complexities between them, just go with the fastest of all. This will give you the baseline performance numbers.</p>

  <blockquote>Start with the simplest or fastest algorithm</blockquote>

  <p>So going back to our news-classification problem, start with logistic regression, then try SVM, then LSTMs, and finally transformers.</p>
  <p><em>You have too much data and can't run with all?</em></p>
  <p>A good problem to have!<br>Select a subset of the data and try different algorithms and then select a handful of those, which came off with flying colors in your test for further experimentation.</p>

  <h3>Choose the right (and only one) metric</h3>
  <p>Selecting the right metric for your specific problem is crucial. What kind of metric you choose will depend on your specific use case. For example, if you are developing a cancer-diagnosis model of medical images, false negatives could be detrimental, so you should be probably better off focusing on recall rather than precision. If you are developing a spam detector, I would bet on precision.</p>

  <p><em>Got it, the metric should be right..but why only one?</em></p>

  <p>When you have several performance metrics, it's very difficult to make a decision about choosing from different models or choosing from different hyperparameters. One metric will you the clarity and peace of mind you require for such decision-making. Need both precision and recall? Use F1-score. Have several other metrics? come up with a custom metric that can account for all the metrics you care for.</p>

  <blockquote>One metric will give you the clarity</blockquote>

  <h3>Track your Experiments</h3>
  <p>Run experiments with your shortlisted algorithms and track those experiments. You can start with simple spreadsheets, but tracking can become a daunting task quickly. If you can, try using services like Weights and Biases or MLflow to make your life simpler.</p>

  <p>Make sure you put aside buckets of data — Training data, Validation Data, Test Data. The main goal of tracking experimentation is to choose a clear winner algorithm.</p>

  <!-- Placeholder for image like wandb tracking -->
  <!-- <p><img src="path/to/wandb_image.png" alt="wandb experiment tracking"></p> -->

  <h3>Communicate, communicate, communicate!</h3>
  <p>Often times there will be silos where stakeholders and data scientists/ engineers will be busy in their own worlds. These will be the times you should look out for when the problem you are working on or approaches you are using could become irrelevant and you will lose your valuable time. Some examples — The product line you are working on could be deprioritized by the product manager or the business requirement changed due to a huge recent customer acquisition.</p>

  <p>Periodic communication is the key! Schedule regular check-ins with all the stakeholders or point-of-contacts in all the related groups. Keep them informed about the progress you have made, show them charts and graphs ( Business folks love them!). Get updates that could affect your project and keep a tab on the performance metric you have agreed on to make sure it's still on!</p>

  <!-- Placeholder for communication image -->
  <!-- <p><img src="path/to/communication_image.png" alt="communication source"></p> -->

  <h3>Test on Production data</h3>
  <p>It's one thing to get satisfactory performance on your test dataset and it's another to deploy safely in production without catastrophic effects. The distribution of production or real-time data could be totally different, which may wreck your model into pieces.</p>

  <p>Once you are satisfied with the model from test dataset performance, it's wise to test on production data. You can choose to run the model offline on this data or passively test the model on the real-time data without impacting the production or even better both! The advantage of using a "kill-switch" kind of deployment is that you can get feedback from the production dataset without fearing the catastrophic effect.</p>

  <p>Selectively applying the model on a subset of the data is also a very useful technique. You may choose 5% of the data to apply the model and monitor the performance before going all-in. You could also increment this percentage slowly until you are confident about the model.</p>

  <h3>Deploy and monitor</h3>
  <p>Deploying ML models in a container in a loosely coupled fashion is a great way for deploying ML models. You can wrap the model in an API for easy consumption as well.</p>

  <p>Monitoring the performance of your model in production is crucial as a number of external factors could impact its performance. The world in which the model is operating changes, data infrastructures changes, or outliers become norm suddenly ...</p>

  <p>In order to avoid this, you may decide to manually review a small subset of the data periodically to identify whether the model is susceptible to the concept drift.</p>

  <blockquote>ML models are high-interest technical credit cards.<br>- Cassie Kozyrkov</blockquote>

  <p>Deploying a successful ML model from start to end is not an easy task, but can become a little easier if you have a plan to stick with. I hope you find these lessons useful in your work!</p>
</div> 