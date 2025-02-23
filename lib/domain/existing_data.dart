import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadQuestionsToFirebase() async {
  for (final sector in data.entries) {
    uploadQuestionsForField(
      sector.key,
      sector.value,
    );
  }
}

Future<void> uploadQuestionsForField(String field, dynamic data) async {
  FirebaseFirestore.instance.collection("ListOfQuestions").doc(field).set(data);
}

final Map<String, dynamic> data = {
  "Flutter": {
    "Questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {
          "1": "Flutter is an open-source backend development framework",
          "2": "Flutter is an open-source UI toolkit",
          "3":
              "Flutter is an open-source programming language for cross-platform applications",
          "4": "Flutters is a DBMS toolkit"
        },
        "questionsText": "What is Flutter?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {
          "1": "Facebook",
          "2": "Microsoft",
          "3": "Google",
          "4": "Oracle"
        },
        "questionsText":
            "Who developed the Flutter Framework and continues to maintain it today?"
      },
      "2": {
        "correctOptionKey": "2",
        "options": {"1": "Kotlin", "2": "Dart", "3": "Java", "4": "Go"},
        "questionsText":
            "Which programming language is used to build Flutter applications?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {"1": "2", "2": "4", "3": "6", "4": "8+"},
        "questionsText": "How many types of widgets are there in Flutter?"
      },
      "4": {
        "correctOptionKey": "1",
        "options": {
          "1": "AOT (ahead-of-time)",
          "2": "JIT (Just-in-time)",
          "3": "Transcompilation",
          "4": "Recompilation"
        },
        "questionsText":
            "When building for iOS, Flutter is restricted to an __ compilation strategy"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "Flow", "2": "Current", "3": "Stream", "4": "Series"},
        "questionsText":
            "A sequence of asynchronous Flutter events is known as a:"
      },
      "6": {
        "correctOptionKey": "2",
        "options": {
          "1": "SQLite",
          "2": "Firebase Database",
          "3": "NOSQL",
          "4": "MYSQL"
        },
        "questionsText":
            "Access to a cloud database through Flutter is available through which service?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {
          "1":
              "Rapid cross-platform application development and debugging tools",
          "2": "Future-proofed technologies and UI resources",
          "3": "Strong supporting tools for application development and launch",
          "4": "All of the above"
        },
        "questionsText":
            "What are some key advantages of Flutter over alternate frameworks?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {
          "1": "Widgets",
          "2": "Keys",
          "3": "Elements",
          "4": "Serial"
        },
        "questionsText":
            "What element is used as an identifier for components when programming in Flutter?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {
          "1": "Unit tests",
          "2": "Widget tests",
          "3": "Integration Tests",
          "4": "All of the above"
        },
        "questionsText":
            "What type of test can examine your code as a complete system?"
      },
      "10": {
        "correctOptionKey": "1",
        "options": {
          "1": "Physics-based",
          "2": "Maths-based",
          "3": "Graph-based",
          "4": "Sim-based"
        },
        "questionsText":
            "What type of Flutter animation allows you to represent real-world behavior?"
      },
      "11": {
        "correctOptionKey": "1",
        "options": {"1": "True", "2": "False"},
        "questionsText":
            "True or false: Flutter boasts improved runtime performance over most application frameworks."
      },
      "12": {
        "correctOptionKey": "2",
        "options": {
          "1": "Flutter --release",
          "2": "Flutter build --release",
          "3": "Flutter run --release",
          "4": "Flutter run --release"
        },
        "questionsText":
            "What command would you use to compile your Flutter app in release mode?"
      },
      "13": {
        "correctOptionKey": "2",
        "options": {
          "1": "main()",
          "2": "runApp()",
          "3": "container()",
          "4": "root()"
        },
        "questionsText":
            "Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?"
      },
      "14": {
        "correctOptionKey": "1",
        "options": {
          "1": "pubspec.yaml",
          "2": "pubspec.xml",
          "3": "config.html",
          "4": "root.xml"
        },
        "questionsText":
            "What is the key configuration file used when building a Flutter project?"
      },
      "15": {
        "correctOptionKey": "2",
        "options": {"1": "True", "2": "False"},
        "questionsText":
            "True or false: an experienced Flutter developer doesn't need to know platform native languages or tools to build apps."
      },
      "16": {
        "correctOptionKey": "2",
        "options": {
          "1": "SafeArea",
          "2": "SizedBox",
          "3": "table",
          "4": "AppBar"
        },
        "questionsText":
            "Which component allows us to specify the distance between widgets on the screen?"
      },
      "17": {
        "correctOptionKey": "1",
        "options": {"1": "Stateful widget", "2": "Stateless widget"},
        "questionsText":
            "Which widget type allows you to modify its appearance dynamically according to user input?"
      },
      "18": {
        "correctOptionKey": "3",
        "options": {
          "1": "Flutter run",
          "2": "Flutter build",
          "3": "Flutter doctor",
          "4": "Flutter help"
        },
        "questionsText":
            "What command would you run to verify your Flutter install and ensure your environment is set up correctly?"
      },
      "19": {
        "correctOptionKey": "3",
        "options": {"1": "Profile", "2": "Debug", "3": "Release", "4": "Test"},
        "questionsText":
            "Which release mode will not contain any debugging data when run?"
      },
      "20": {
        "correctOptionKey": "2",
        "options": {"1": "Kotlin", "2": "C++", "3": "Dart", "4": "Java"},
        "questionsText":
            "What language is Flutter's rendering engine primarily written in?"
      },
      "21": {
        "correctOptionKey": "4",
        "options": {
          "1": "Non-native looking application UI",
          "2": "Large application footprint",
          "3": "A relatively unproven framework and language",
          "4": "All of the above"
        },
        "questionsText":
            "What is a drawback of Flutter that might lead you to choose another solution?"
      },
      "22": {
        "correctOptionKey": "1",
        "options": {"1": "True", "2": "False"},
        "questionsText":
            "True or False: Flutter supports desktop application development."
      },
      "23": {
        "correctOptionKey": "2",
        "options": {
          "1": "ExpandedView",
          "2": "ListView",
          "3": "Stack",
          "4": "ArrayView"
        },
        "questionsText":
            "What widget would you use for repeating content in Flutter?"
      },
      "24": {
        "correctOptionKey": "2",
        "options": {"1": "True", "2": "False"},
        "questionsText":
            "True or False: Flutter teams are inherently more difficult to manage because the framework is so new."
      }
    },
  },
  "AI and Machine Learning": {
    "Questions": {
      "0": {
        "correctOptionKey": "3",
        "options": {
          "1": "To make computers intelligent",
          "2": "To automate manual tasks",
          "3": "To enable computers to learn from data",
          "4": "To create self-aware machines"
        },
        "questionsText": "What is the main goal of machine learning?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {
          "1": "A physical machine that performs computations",
          "2": "A representation of the data",
          "3": "A set of training examples",
          "4": "A type of computer algorithm"
        },
        "questionsText": "In machine learning, what is a model?"
      },
      "2": {
        "correctOptionKey": "4",
        "options": {
          "1": "Clustering",
          "2": "Reinforcement learning",
          "3": "Dimensionality reduction",
          "4": "Classification"
        },
        "questionsText": "Which of the following is a supervised learning task?"
      },
      "3": {
        "correctOptionKey": "3",
        "options": {
          "1": "Mean Squared Error (MSE)",
          "2": "Accuracy",
          "3": "F1-score",
          "4": "R-squared"
        },
        "questionsText":
            "Which evaluation metric is commonly used for classification tasks when class imbalance is present?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {
          "1": "To train the model",
          "2": "To fine-tune hyperparameters",
          "3": "To test the model's generalization",
          "4": "To provide additional training data"
        },
        "questionsText":
            "What is the purpose of the validation set in machine learning?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {
          "1": "Supervised learning",
          "2": "Unsupervised learning",
          "3": "Reinforcement learning",
          "4": "Deep learning"
        },
        "questionsText":
            "Which type of machine learning algorithm aims to mimic the process of human learning?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {
          "1":
              "When a model performs well on the training data but poorly on new data",
          "2":
              "When a model performs well on new data but poorly on the training data",
          "3": "When a model perfectly fits the training data",
          "4": "When a model is too simple to capture the underlying patterns"
        },
        "questionsText":
            "What does the term 'overfitting' refer to in machine learning?"
      },
      "7": {
        "correctOptionKey": "2",
        "options": {
          "1": "K-Means clustering",
          "2": "Random Forest",
          "3": "K-Nearest Neighbors (KNN)",
          "4": "Apriori algorithm"
        },
        "questionsText":
            "Which machine learning algorithm is suitable for solving regression problems?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {
          "1": "Clustering",
          "2": "Feature extraction",
          "3": "Feature selection",
          "4": "Regularization"
        },
        "questionsText":
            "Which technique is used to reduce the dimensionality of data while preserving as much information as possible?"
      },
      "9": {
        "correctOptionKey": "4",
        "options": {
          "1": "To handle outliers",
          "2": "To avoid overfitting",
          "3": "To model the noise in the data",
          "4": "To shift the regression line up or down"
        },
        "questionsText":
            "What is the purpose of the bias term in a linear regression model?"
      },
      "10": {
        "correctOptionKey": "3",
        "options": {
          "1": "Decision Trees",
          "2": "K-Means clustering",
          "3": "Apriori algorithm",
          "4": "Support Vector Machines (SVM)"
        },
        "questionsText":
            "Which algorithm is used for finding frequent itemsets in transactional databases?"
      },
      "11": {
        "correctOptionKey": "2",
        "options": {
          "1":
              "The trade-off between the quality of training data and testing data",
          "2":
              "The trade-off between the complexity of a model and its ability to generalize",
          "3":
              "The trade-off between the number of features and the size of the dataset",
          "4": "The trade-off between precision and recall in classification"
        },
        "questionsText":
            "In the context of machine learning, what is the term 'bias-variance trade-off' referring to?"
      },
      "12": {
        "correctOptionKey": "2",
        "options": {
          "1": "K-Means clustering",
          "2": "Agglomerative clustering",
          "3": "DBSCAN",
          "4": "Principal Component Analysis (PCA)"
        },
        "questionsText": "Which algorithm is used for hierarchical clustering?"
      },
      "13": {
        "correctOptionKey": "4",
        "options": {
          "1": "Removing the entire column with missing data",
          "2": "Replacing missing data with the median value of the column",
          "3": "Ignoring the rows with missing data during analysis",
          "4": "All of the above"
        },
        "questionsText":
            "Which method can be used to handle missing data in a dataset?"
      },
      "14": {
        "correctOptionKey": "1",
        "options": {
          "1": "Hidden layers",
          "2": "Output layers",
          "3": "Feature layers",
          "4": "Input layers"
        },
        "questionsText":
            "In a neural network, what are the layers between the input and output layers called?"
      },
      "15": {
        "correctOptionKey": "1",
        "options": {
          "1": "Gradient Descent",
          "2": "K-Means",
          "3": "Apriori algorithm",
          "4": "Decision Trees"
        },
        "questionsText":
            "Which optimization algorithm is commonly used to update the weights of neural networks during training?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {
          "1": "ReLU activation function",
          "2": "Sigmoid activation function",
          "3": "Tanh activation function",
          "4": "Batch normalization"
        },
        "questionsText":
            "Which technique is used to combat the vanishing gradient problem in deep neural networks?"
      },
      "17": {
        "correctOptionKey": "4",
        "options": {
          "1": "K-Means clustering",
          "2": "Decision Trees",
          "3": "Support Vector Machines (SVM)",
          "4": "Artificial Neural Networks"
        },
        "questionsText":
            "Which machine learning algorithm is inspired by the functioning of the human brain's neural networks?"
      },
      "18": {
        "correctOptionKey": "3",
        "options": {
          "1": "K-Means clustering",
          "2": "Decision Trees",
          "3": "Gradient Boosting",
          "4": "K-Nearest Neighbors (KNN)"
        },
        "questionsText":
            "Which ensemble learning method combines multiple weak learners to create a strong learner?"
      },
      "19": {
        "correctOptionKey": "4",
        "options": {
          "1": "A technique to add more features to the dataset",
          "2": "A method to increase the regularization term",
          "3": "A way to perform dimensionality reduction",
          "4": "A way to implicitly map data to higher-dimensional spaces"
        },
        "questionsText":
            "In the context of Support Vector Machines (SVM), what is the 'kernel trick'?"
      },
      "20": {
        "correctOptionKey": "3",
        "options": {
          "1": "Supervised learning",
          "2": "Unsupervised learning",
          "3": "Reinforcement learning",
          "4": "Semi-supervised learning"
        },
        "questionsText":
            "Which type of learning is characterized by an agent learning through interactions with an environment and receiving rewards?"
      },
      "21": {
        "correctOptionKey": "2",
        "options": {
          "1": "To convert categorical features into numerical features",
          "2": "To normalize the feature values to a standard range",
          "3": "To create new features from existing ones",
          "4": "To reduce the number of features in the dataset"
        },
        "questionsText":
            "What is the primary goal of feature scaling in machine learning?"
      },
      "22": {
        "correctOptionKey": "3",
        "options": {
          "1": "Decision Trees",
          "2": "K-Means clustering",
          "3": "Support Vector Machines (SVM)",
          "4": "Naive Bayes"
        },
        "questionsText":
            "Which machine learning algorithm is sensitive to the scale of features and requires feature scaling?"
      },
      "23": {
        "correctOptionKey": "2",
        "options": {
          "1": "It is divided into k equal subsets",
          "2":
              "It is divided into k-1 training subsets and 1 validation subset",
          "3":
              "It is divided into training and testing subsets based on a ratio",
          "4": "It is divided randomly into disjoint subsets"
        },
        "questionsText":
            "In a k-fold cross-validation, how is the dataset divided?"
      },
      "24": {
        "correctOptionKey": "2",
        "options": {
          "1": "Feature extraction",
          "2": "Regularization",
          "3": "Cross-validation",
          "4": "Principal Component Analysis (PCA)"
        },
        "questionsText":
            "Which technique is used to reduce the impact of noise and outliers in a dataset?"
      },
      "25": {
        "correctOptionKey": "2",
        "options": {
          "1": "Random Forest",
          "2": "K-Means clustering",
          "3": "Support Vector Machines (SVM)",
          "4": "Hierarchical clustering"
        },
        "questionsText":
            "Which algorithm is used for finding the optimal clustering of data points?"
      },
      "26": {
        "correctOptionKey": "1",
        "options": {
          "1": "To make predictions",
          "2": "To split the data",
          "3": "To represent features",
          "4": "To store feature values"
        },
        "questionsText":
            "What is the primary purpose of a decision tree's leaf nodes?"
      },
      "27": {
        "correctOptionKey": "2",
        "options": {
          "1": "Clustering",
          "2": "Classification",
          "3": "Regression",
          "4": "Anomaly detection"
        },
        "questionsText":
            "Which machine learning approach is based on the assumption that similar data points are more likely to have the same labels?"
      },
      "28": {
        "correctOptionKey": "2",
        "options": {
          "1": "Horizontal axis",
          "2": "Vertical axis",
          "3": "Both axes equally",
          "4": "None of the above"
        },
        "questionsText":
            "In a precision-recall curve, which axis represents precision?"
      },
      "29": {
        "correctOptionKey": "2",
        "options": {
          "1": "To make the model more complex",
          "2": "To avoid underfitting",
          "3": "To encourage overfitting",
          "4": "To reduce the complexity of the model"
        },
        "questionsText":
            "What is the purpose of regularization in linear regression?"
      }
    }
  },
  "Geography": {
    "Questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {
          "1": "Kathmandu",
          "2": "Pokhara",
          "3": "Lalitpur",
          "4": "Biratnagar"
        },
        "questionsText": "What is the capital of Nepal?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {
          "1": "Mount Everest",
          "2": "Kangchenjunga",
          "3": "Annapurna",
          "4": "Makalu"
        },
        "questionsText": "Which is the highest mountain in Nepal?"
      },
      "2": {
        "correctOptionKey": "2",
        "options": {
          "1": "India",
          "2": "China",
          "3": "Bangladesh",
          "4": "Bhutan"
        },
        "questionsText": "Which country borders Nepal to the north?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {
          "1": "Himalayan Mountains",
          "2": "Terai",
          "3": "Mid-Hills",
          "4": "Southern Plains"
        },
        "questionsText":
            "What is the name of the mountain range that runs along Nepal's northern border?"
      },
      "4": {
        "correctOptionKey": "3",
        "options": {
          "1": "Chitwan",
          "2": "Lumbini",
          "3": "Pokhara",
          "4": "Rara Lake"
        },
        "questionsText":
            "Which is a popular tourist destination known for its scenic beauty and adventure sports in Nepal?"
      },
      "5": {
        "correctOptionKey": "4",
        "options": {"1": "Bagmati", "2": "Koshi", "3": "Gandaki", "4": "Seti"},
        "questionsText": "Which river flows through the city of Pokhara?"
      },
      "6": {
        "correctOptionKey": "1",
        "options": {
          "1": "Nepal is landlocked",
          "2": "Nepal has a coastline",
          "3": "Nepal is an island nation",
          "4": "Nepal has a coastline along the Indian Ocean"
        },
        "questionsText":
            "What is the geographical feature of Nepal in terms of coastlines?"
      },
      "7": {
        "correctOptionKey": "2",
        "options": {
          "1": "Sagarmatha National Park",
          "2": "Chitwan National Park",
          "3": "Langtang National Park",
          "4": "Bardiya National Park"
        },
        "questionsText":
            "Which national park in Nepal is famous for its rhinos and Bengal tigers?"
      },
      "8": {
        "correctOptionKey": "3",
        "options": {
          "1": "Himalayas",
          "2": "Tibetan Plateau",
          "3": "Terai",
          "4": "Lumbini"
        },
        "questionsText": "Where is the Terai region located in Nepal?"
      },
      "9": {
        "correctOptionKey": "4",
        "options": {
          "1": "Pokhara Valley",
          "2": "Bagmati Valley",
          "3": "Karnali River Valley",
          "4": "Kathmandu Valley"
        },
        "questionsText": "Which valley is home to Nepal’s capital city?"
      },
      "10": {
        "correctOptionKey": "1",
        "options": {
          "1": "Nepali",
          "2": "Maithili",
          "3": "Bhojpuri",
          "4": "English"
        },
        "questionsText": "What is the official language of Nepal?"
      },
      "11": {
        "correctOptionKey": "2",
        "options": {
          "1": "Chitwan",
          "2": "Rara Lake",
          "3": "Gosaikunda",
          "4": "Phewa Lake"
        },
        "questionsText":
            "Which lake is located in the central region of Nepal and is a popular tourist attraction?"
      },
      "12": {
        "correctOptionKey": "3",
        "options": {
          "1": "Madhes",
          "2": "Pahadi",
          "3": "Himalayan",
          "4": "Badhni"
        },
        "questionsText":
            "Which region of Nepal is known for its fertile plains and is densely populated?"
      },
      "13": {
        "correctOptionKey": "4",
        "options": {
          "1": "Buddhist",
          "2": "Hindu",
          "3": "Christian",
          "4": "Both Hindu and Buddhist"
        },
        "questionsText": "What are the two major religions practiced in Nepal?"
      },
      "14": {
        "correctOptionKey": "1",
        "options": {
          "1": "Nepal Rastra Bank",
          "2": "Central Bank of Nepal",
          "3": "Nepali Reserve Bank",
          "4": "Nepal Bank Limited"
        },
        "questionsText": "Which is the central bank of Nepal?"
      },
      "15": {
        "correctOptionKey": "2",
        "options": {
          "1": "Rivers",
          "2": "Lakes",
          "3": "Forests",
          "4": "Agriculture"
        },
        "questionsText":
            "Which natural feature is important for the water resources in Nepal?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {"1": "Buddha", "2": "Shiva", "3": "Vishnu", "4": "Krishna"},
        "questionsText":
            "Which deity is said to have been born in Lumbini, Nepal?"
      },
      "17": {
        "correctOptionKey": "4",
        "options": {
          "1": "Mount Everest",
          "2": "Annapurna",
          "3": "Kanchenjunga",
          "4": "Makalu"
        },
        "questionsText":
            "Which mountain in Nepal is known as the fifth highest in the world?"
      },
      "18": {
        "correctOptionKey": "2",
        "options": {
          "1": "Lalitpur",
          "2": "Bhaktapur",
          "3": "Pokhara",
          "4": "Kathmandu"
        },
        "questionsText":
            "Which city in Nepal is known for its ancient temples and historical significance?"
      },
      "19": {
        "correctOptionKey": "3",
        "options": {
          "1": "Dhulikhel",
          "2": "Nagarkot",
          "3": "Bandipur",
          "4": "Sauraha"
        },
        "questionsText":
            "Which place is famous for its preserved cultural heritage and scenic views in Nepal?"
      },
      "20": {
        "correctOptionKey": "1",
        "options": {
          "1": "Buddhist",
          "2": "Hindu",
          "3": "Muslim",
          "4": "Christian"
        },
        "questionsText": "What is the majority religion in Nepal?"
      }
    }
  },
  "Nepal History": {
    "Questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {
          "1": "Maharaja Prithvi Narayan Shah",
          "2": "King Prithvi Narayan Shah",
          "3": "King Tribhuvan",
          "4": "King Birendra"
        },
        "questionsText":
            "Who is regarded as the founder of the Shah dynasty in Nepal?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {
          "1": "King Birendra",
          "2": "King Tribhuvan",
          "3": "King Prithvi Narayan Shah",
          "4": "King Mahendra"
        },
        "questionsText": "Which king unified Nepal in the 18th century?"
      },
      "2": {
        "correctOptionKey": "1",
        "options": {
          "1": "Kathmandu",
          "2": "Pokhara",
          "3": "Lalitpur",
          "4": "Biratnagar"
        },
        "questionsText":
            "Where did the historic 1951 revolution take place in Nepal?"
      },
      "3": {
        "correctOptionKey": "2",
        "options": {"1": "1991", "2": "1990", "3": "1985", "4": "2001"},
        "questionsText":
            "In which year did the People’s Movement (Jana Andolan) take place, leading to the end of the autocratic Panchayat regime?"
      },
      "4": {
        "correctOptionKey": "4",
        "options": {
          "1": "Nepal became a Republic in 2008",
          "2": "Nepal became a Republic in 1990",
          "3": "Nepal became a Republic in 2000",
          "4": "Nepal became a Republic in 2008"
        },
        "questionsText": "When did Nepal officially become a Republic?"
      },
      "5": {
        "correctOptionKey": "1",
        "options": {
          "1": "The Rana Regime",
          "2": "The British colonial rule",
          "3": "The Shah Dynasty",
          "4": "The Panchayat Era"
        },
        "questionsText":
            "Which regime ruled Nepal for over a century before the 1951 revolution?"
      },
      "6": {
        "correctOptionKey": "3",
        "options": {
          "1": "King Mahendra",
          "2": "King Tribhuvan",
          "3": "Jung Bahadur Rana",
          "4": "King Prithvi Narayan Shah"
        },
        "questionsText": "Who was the first Prime Minister of Nepal?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "1900", "2": "1950", "3": "1970", "4": "1990"},
        "questionsText": "When did the first political parties emerge in Nepal?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {
          "1": "The Anglo-Nepalese War",
          "2": "The Sugauli Treaty",
          "3": "The Treaty of Paris",
          "4": "The Sino-Nepal Treaty"
        },
        "questionsText":
            "Which treaty resulted in the loss of significant portions of Nepali territory to the British in the 19th century?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {
          "1": "Nepal's entry into the United Nations",
          "2": "Nepal became a monarchy",
          "3": "The first democratic elections of Nepal were held in 1959",
          "4": "The first election of the Panchayat system"
        },
        "questionsText":
            "Which event marked the beginning of a parliamentary democracy in Nepal?"
      },
      "10": {
        "correctOptionKey": "2",
        "options": {
          "1": "The creation of the first map of Nepal",
          "2": "The establishment of the Nepali Congress party",
          "3": "The formation of the Shah dynasty",
          "4": "The arrival of Buddhism in Nepal"
        },
        "questionsText":
            "Which event is associated with the early formation of a modern democratic movement in Nepal?"
      },
      "11": {
        "correctOptionKey": "3",
        "options": {
          "1": "The arrival of the British in Nepal",
          "2": "The battle of Jagdishpur",
          "3": "The unification of Nepal under King Prithvi Narayan Shah",
          "4": "The overthrow of the Rana rule"
        },
        "questionsText":
            "Which event in Nepal's history marked the beginning of its political unification?"
      },
      "12": {
        "correctOptionKey": "4",
        "options": {
          "1": "The Nepali Congress party",
          "2": "The Communist Party of Nepal",
          "3": "The Jana Andolan Party",
          "4": "The Nepal Workers' and Peasants' Party"
        },
        "questionsText":
            "Which political party played a crucial role in the overthrow of the Rana regime in Nepal?"
      },
      "13": {
        "correctOptionKey": "1",
        "options": {
          "1": "Jana Andolan",
          "2": "Nepalese Revolution",
          "3": "The Maoist Insurgency",
          "4": "The Democracy Movement"
        },
        "questionsText":
            "What is the name of the 1990 movement that ended the Panchayat system in Nepal?"
      },
      "14": {
        "correctOptionKey": "2",
        "options": {
          "1": "Maoist Insurgency",
          "2": "People's War",
          "3": "The Political Revolution",
          "4": "The Terai Movement"
        },
        "questionsText":
            "What was the name of the armed conflict between Maoist rebels and the government of Nepal from 1996 to 2006?"
      },
      "15": {
        "correctOptionKey": "3",
        "options": {
          "1": "King Prithvi Narayan Shah",
          "2": "King Tribhuvan",
          "3": "King Birendra",
          "4": "King Mahendra"
        },
        "questionsText":
            "Which king is remembered for promoting peace and stability in Nepal and was a beloved figure during his reign?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {
          "1": "The Nepalese Civil War",
          "2": "The Sauraha Movement",
          "3": "The Nepali Revolution",
          "4": "The Mahendra Era"
        },
        "questionsText":
            "What is another name for the Maoist insurgency in Nepal?"
      },
      "17": {
        "correctOptionKey": "2",
        "options": {
          "1": "King Prithvi Narayan Shah",
          "2": "King Tribhuvan",
          "3": "King Mahendra",
          "4": "King Birendra"
        },
        "questionsText":
            "Which king's reign led to the establishment of a multi-party democracy in Nepal?"
      },
      "18": {
        "correctOptionKey": "4",
        "options": {
          "1": "The Declaration of the State of Emergency",
          "2": "The Return of the King",
          "3": "The Signing of the Peace Accord",
          "4": "The Birth of the People's Republic of Nepal"
        },
        "questionsText":
            "Which major political event occurred in Nepal in 2008?"
      },
      "19": {
        "correctOptionKey": "3",
        "options": {
          "1": "The birth of the modern state",
          "2": "Nepal's incorporation into the British Empire",
          "3": "The formation of a democratic republic",
          "4": "Nepal's independence from China"
        },
        "questionsText":
            "What was the result of Nepal's political revolution in 2008?"
      }
    }
  },
  "Science": {
    "Questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {
          "1": "The Earth revolves around the Sun",
          "2": "The Moon revolves around the Earth",
          "3": "The Sun revolves around the Earth",
          "4": "The Earth and Sun revolve around each other"
        },
        "questionsText": "What is the correct description of the Earth's orbit?"
      },
      "1": {
        "correctOptionKey": "2",
        "options": {
          "1": "Protons",
          "2": "Electrons",
          "3": "Neutrons",
          "4": "Nuclei"
        },
        "questionsText": "Which subatomic particle is negatively charged?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {"1": "H2O", "2": "CO2", "3": "O2", "4": "H2"},
        "questionsText": "What is the chemical symbol for oxygen?"
      },
      "3": {
        "correctOptionKey": "4",
        "options": {
          "1": "Newton",
          "2": "Einstein",
          "3": "Curie",
          "4": "Darwin"
        },
        "questionsText": "Who is known for the theory of evolution?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {"1": "Mercury", "2": "Venus", "3": "Earth", "4": "Mars"},
        "questionsText": "Which planet is the hottest in our solar system?"
      },
      "5": {
        "correctOptionKey": "1",
        "options": {
          "1": "Water",
          "2": "Oxygen",
          "3": "Carbon",
          "4": "Nitrogen"
        },
        "questionsText":
            "Which substance is essential for photosynthesis in plants?"
      },
      "6": {
        "correctOptionKey": "3",
        "options": {
          "1": "Gravity",
          "2": "Magnetism",
          "3": "Electromagnetism",
          "4": "Friction"
        },
        "questionsText":
            "Which force is responsible for the functioning of electric motors?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "Atom", "2": "Molecule", "3": "Electron", "4": "Cell"},
        "questionsText": "What is the basic unit of life?"
      },
      "8": {
        "correctOptionKey": "1",
        "options": {
          "1": "Hydrogen",
          "2": "Carbon",
          "3": "Oxygen",
          "4": "Nitrogen"
        },
        "questionsText": "What is the most abundant element in the universe?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {"1": "Mars", "2": "Venus", "3": "Earth", "4": "Saturn"},
        "questionsText":
            "Which planet is often called Earth's twin due to its similar size?"
      },
      "10": {
        "correctOptionKey": "3",
        "options": {
          "1": "Albert Einstein",
          "2": "Isaac Newton",
          "3": "Marie Curie",
          "4": "Nikola Tesla"
        },
        "questionsText": "Who is known for the discovery of radioactivity?"
      },
      "11": {
        "correctOptionKey": "4",
        "options": {
          "1": "Earth's crust",
          "2": "The atmosphere",
          "3": "The Earth's mantle",
          "4": "The core"
        },
        "questionsText": "Where is the Earth's molten core located?"
      },
      "12": {
        "correctOptionKey": "2",
        "options": {
          "1": "Plant cell",
          "2": "Animal cell",
          "3": "Fungal cell",
          "4": "Bacterial cell"
        },
        "questionsText": "Which type of cell does not have a cell wall?"
      },
      "13": {
        "correctOptionKey": "1",
        "options": {
          "1": "Water",
          "2": "Nitrogen",
          "3": "Oxygen",
          "4": "Carbon dioxide"
        },
        "questionsText": "What is the most common solvent on Earth?"
      },
      "14": {
        "correctOptionKey": "3",
        "options": {"1": "Acid", "2": "Base", "3": "Neutral", "4": "Alkaline"},
        "questionsText": "What is the pH level of pure water?"
      },
      "15": {
        "correctOptionKey": "2",
        "options": {"1": "Liquid", "2": "Gas", "3": "Plasma", "4": "Solid"},
        "questionsText":
            "In what state of matter are particles most widely spaced?"
      },
      "16": {
        "correctOptionKey": "1",
        "options": {
          "1": "Carbon",
          "2": "Hydrogen",
          "3": "Oxygen",
          "4": "Nitrogen"
        },
        "questionsText":
            "Which element is commonly known as the building block of life?"
      },
      "17": {
        "correctOptionKey": "3",
        "options": {
          "1": "Genetics",
          "2": "Evolution",
          "3": "Hereditary",
          "4": "Cytology"
        },
        "questionsText":
            "Which branch of science is focused on how traits are passed from one generation to the next?"
      },
      "18": {
        "correctOptionKey": "4",
        "options": {
          "1": "Animalia",
          "2": "Protista",
          "3": "Fungi",
          "4": "Plantae"
        },
        "questionsText": "Which kingdom of life includes all plants?"
      },
      "19": {
        "correctOptionKey": "2",
        "options": {
          "1": "Atom",
          "2": "Molecule",
          "3": "Neutron",
          "4": "Proton"
        },
        "questionsText": "What is the smallest unit of a chemical compound?"
      },
      "20": {
        "correctOptionKey": "3",
        "options": {"1": "Earth", "2": "Mars", "3": "Saturn", "4": "Jupiter"},
        "questionsText": "Which planet has the most moons?"
      },
      "21": {
        "correctOptionKey": "1",
        "options": {
          "1": "Photosynthesis",
          "2": "Respiration",
          "3": "Fermentation",
          "4": "Excretion"
        },
        "questionsText":
            "What is the process by which plants make their food using sunlight?"
      },
      "22": {
        "correctOptionKey": "4",
        "options": {
          "1": "Bacteria",
          "2": "Virus",
          "3": "Fungus",
          "4": "Archaea"
        },
        "questionsText":
            "Which organism is known for surviving in extreme conditions, such as deep-sea vents?"
      },
      "23": {
        "correctOptionKey": "2",
        "options": {
          "1": "The Giraffe",
          "2": "The Ostrich",
          "3": "The Elephant",
          "4": "The Cheetah"
        },
        "questionsText": "Which animal is the fastest land mammal?"
      },
      "24": {
        "correctOptionKey": "3",
        "options": {
          "1": "The Amazon",
          "2": "The Ganges",
          "3": "The Nile",
          "4": "The Yangtze"
        },
        "questionsText": "Which is the longest river in the world?"
      },
      "25": {
        "correctOptionKey": "1",
        "options": {
          "1": "The Big Bang Theory",
          "2": "The Steady State Theory",
          "3": "The Oscillating Model",
          "4": "The Multiverse Theory"
        },
        "questionsText": "Which theory explains the origin of the universe?"
      },
      "26": {
        "correctOptionKey": "4",
        "options": {
          "1": "Neutron Star",
          "2": "White Dwarf",
          "3": "Black Hole",
          "4": "Supernova"
        },
        "questionsText":
            "What occurs when a massive star explodes, releasing energy?"
      },
      "27": {
        "correctOptionKey": "2",
        "options": {"1": "Mercury", "2": "Venus", "3": "Earth", "4": "Mars"},
        "questionsText":
            "Which planet is known for having the hottest surface temperature?"
      },
      "28": {
        "correctOptionKey": "3",
        "options": {
          "1": "Amphibians",
          "2": "Reptiles",
          "3": "Birds",
          "4": "Mammals"
        },
        "questionsText": "Which group of animals lay eggs and have feathers?"
      },
      "29": {
        "correctOptionKey": "1",
        "options": {
          "1": "The Eiffel Tower",
          "2": "The Great Wall of China",
          "3": "The Pyramids of Giza",
          "4": "The Taj Mahal"
        },
        "questionsText":
            "Which landmark is considered one of the seven wonders of the modern world?"
      }
    }
  },
  "Sports": {
    "Questions": {
      "0": {
        "correctOptionKey": "2",
        "options": {
          "1": "Basketball",
          "2": "Football",
          "3": "Cricket",
          "4": "Tennis"
        },
        "questionsText": "Which sport is known as 'The Beautiful Game'?"
      },
      "1": {
        "correctOptionKey": "4",
        "options": {
          "1": "Rafael Nadal",
          "2": "Roger Federer",
          "3": "Novak Djokovic",
          "4": "Serena Williams"
        },
        "questionsText":
            "Who holds the record for the most Grand Slam titles in tennis?"
      },
      "2": {
        "correctOptionKey": "3",
        "options": {
          "1": "Kareem Abdul-Jabbar",
          "2": "Michael Jordan",
          "3": "LeBron James",
          "4": "Stephen Curry"
        },
        "questionsText": "Who is known as the 'King' of basketball?"
      },
      "3": {
        "correctOptionKey": "1",
        "options": {
          "1": "Pele",
          "2": "Lionel Messi",
          "3": "Cristiano Ronaldo",
          "4": "Diego Maradona"
        },
        "questionsText":
            "Which footballer is often regarded as the greatest of all time?"
      },
      "4": {
        "correctOptionKey": "2",
        "options": {"1": "USA", "2": "Russia", "3": "China", "4": "Japan"},
        "questionsText": "Which country hosted the 2014 Winter Olympics?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {
          "1": "New York Yankees",
          "2": "Boston Red Sox",
          "3": "Los Angeles Dodgers",
          "4": "Chicago Cubs"
        },
        "questionsText": "Which MLB team is based in Los Angeles?"
      },
      "6": {
        "correctOptionKey": "4",
        "options": {
          "1": "Lionel Messi",
          "2": "Kylian Mbappé",
          "3": "Neymar Jr.",
          "4": "Cristiano Ronaldo"
        },
        "questionsText":
            "Which footballer won the Ballon d'Or in 2008, 2013, and 2014?"
      },
      "7": {
        "correctOptionKey": "1",
        "options": {"1": "Tokyo", "2": "Beijing", "3": "Paris", "4": "London"},
        "questionsText": "Which city will host the 2024 Summer Olympics?"
      },
      "8": {
        "correctOptionKey": "2",
        "options": {
          "1": "Sweden",
          "2": "Denmark",
          "3": "Norway",
          "4": "Finland"
        },
        "questionsText":
            "Which country is home to the football team known as the 'Vikings'?"
      },
      "9": {
        "correctOptionKey": "3",
        "options": {
          "1": "India",
          "2": "Australia",
          "3": "South Africa",
          "4": "New Zealand"
        },
        "questionsText":
            "Which country is known for its rugby team called the 'Springboks'?"
      },
      "10": {
        "correctOptionKey": "4",
        "options": {
          "1": "Roger Federer",
          "2": "Rafael Nadal",
          "3": "Novak Djokovic",
          "4": "Andy Murray"
        },
        "questionsText":
            "Which tennis player is known for winning the 2013 Wimbledon Championships?"
      },
      "11": {
        "correctOptionKey": "1",
        "options": {
          "1": "Cristiano Ronaldo",
          "2": "Lionel Messi",
          "3": "Neymar",
          "4": "Paul Pogba"
        },
        "questionsText": "Which footballer is known as 'CR7'?"
      },
      "12": {
        "correctOptionKey": "2",
        "options": {
          "1": "Diego Maradona",
          "2": "Lionel Messi",
          "3": "Cristiano Ronaldo",
          "4": "Pele"
        },
        "questionsText": "Who is known as the 'Argentine wizard'?"
      },
      "13": {
        "correctOptionKey": "3",
        "options": {
          "1": "Manchester United",
          "2": "Arsenal",
          "3": "Liverpool",
          "4": "Chelsea"
        },
        "questionsText":
            "Which football club won the 2019 UEFA Champions League?"
      },
      "14": {
        "correctOptionKey": "4",
        "options": {
          "1": "Formula 1",
          "2": "MotoGP",
          "3": "IndyCar",
          "4": "NASCAR"
        },
        "questionsText":
            "Which motorsport series is known for having oval tracks and a high level of speed?"
      },
      "15": {
        "correctOptionKey": "1",
        "options": {
          "1": "Serena Williams",
          "2": "Venus Williams",
          "3": "Steffi Graf",
          "4": "Martina Navratilova"
        },
        "questionsText":
            "Which tennis player has won the most Grand Slam singles titles in the Open Era?"
      },
      "16": {
        "correctOptionKey": "2",
        "options": {
          "1": "Roger Federer",
          "2": "Rafael Nadal",
          "3": "Novak Djokovic",
          "4": "Andy Murray"
        },
        "questionsText": "Which tennis player won the French Open 13 times?"
      },
      "17": {
        "correctOptionKey": "3",
        "options": {
          "1": "Tennis",
          "2": "Basketball",
          "3": "Baseball",
          "4": "Football"
        },
        "questionsText":
            "Which sport has teams that are known as the 'Yankees' and 'Red Sox'?"
      },
      "18": {
        "correctOptionKey": "4",
        "options": {
          "1": "India",
          "2": "Pakistan",
          "3": "Australia",
          "4": "England"
        },
        "questionsText":
            "Which country is home to the famous cricket rivalry between 'The Ashes'?"
      },
      "19": {
        "correctOptionKey": "1",
        "options": {
          "1": "Michael Phelps",
          "2": "Usain Bolt",
          "3": "Michael Jordan",
          "4": "Tom Brady"
        },
        "questionsText":
            "Who holds the record for the most Olympic gold medals?"
      },
      "20": {
        "correctOptionKey": "2",
        "options": {
          "1": "India",
          "2": "Brazil",
          "3": "Germany",
          "4": "Argentina"
        },
        "questionsText":
            "Which country is known for its football team called 'Samba'?"
      },
      "21": {
        "correctOptionKey": "3",
        "options": {"1": "FIFA", "2": "UEFA", "3": "ICC", "4": "NBA"},
        "questionsText":
            "Which governing body is responsible for organizing the Cricket World Cup?"
      },
      "22": {
        "correctOptionKey": "4",
        "options": {
          "1": "Brazil",
          "2": "Argentina",
          "3": "France",
          "4": "Italy"
        },
        "questionsText": "Which country has won the FIFA World Cup 4 times?"
      },
      "23": {
        "correctOptionKey": "1",
        "options": {
          "1": "Cricket",
          "2": "Football",
          "3": "Baseball",
          "4": "Rugby"
        },
        "questionsText":
            "Which sport is known for playing with a bat and a ball on a field?"
      },
      "24": {
        "correctOptionKey": "2",
        "options": {"1": "Formula 1", "2": "MotoGP", "3": "NASCAR", "4": "WRC"},
        "questionsText": "Which motorsport involves races on motorcycles?"
      },
      "25": {
        "correctOptionKey": "3",
        "options": {
          "1": "Michael Phelps",
          "2": "Usain Bolt",
          "3": "Caeleb Dressel",
          "4": "Katie Ledecky"
        },
        "questionsText":
            "Who is an American swimmer that has won multiple Olympic gold medals?"
      },
      "26": {
        "correctOptionKey": "4",
        "options": {
          "1": "Brazil",
          "2": "Germany",
          "3": "Argentina",
          "4": "France"
        },
        "questionsText": "Which country won the 2018 FIFA World Cup?"
      },
      "27": {
        "correctOptionKey": "1",
        "options": {
          "1": "Roger Federer",
          "2": "Novak Djokovic",
          "3": "Rafael Nadal",
          "4": "Andy Murray"
        },
        "questionsText": "Who is known as the 'Swiss Maestro' in tennis?"
      },
      "28": {
        "correctOptionKey": "2",
        "options": {
          "1": "Michael Jordan",
          "2": "LeBron James",
          "3": "Stephen Curry",
          "4": "Kobe Bryant"
        },
        "questionsText":
            "Who is considered the best player in NBA history by some analysts?"
      },
      "29": {
        "correctOptionKey": "3",
        "options": {
          "1": "Usain Bolt",
          "2": "Michael Phelps",
          "3": "Simone Biles",
          "4": "Katie Ledecky"
        },
        "questionsText": "Who is known as the greatest gymnast of all time?"
      }
    }
  },
  "Technology": {
    "Questions": {
      "0": {
        "correctOptionKey": "1",
        "options": {
          "1": "Apple",
          "2": "Microsoft",
          "3": "Google",
          "4": "Amazon"
        },
        "questionsText": "Which company created the iPhone?"
      },
      "1": {
        "correctOptionKey": "3",
        "options": {
          "1": "Windows XP",
          "2": "Windows 7",
          "3": "Windows 10",
          "4": "Windows 8"
        },
        "questionsText":
            "Which version of Windows introduced the Start Menu in its new form?"
      },
      "2": {
        "correctOptionKey": "4",
        "options": {"1": "Python", "2": "Java", "3": "C++", "4": "JavaScript"},
        "questionsText":
            "Which programming language is primarily used for web development?"
      },
      "3": {
        "correctOptionKey": "2",
        "options": {
          "1": "Facebook",
          "2": "Mark Zuckerberg",
          "3": "Jack Dorsey",
          "4": "Larry Page"
        },
        "questionsText": "Who is the co-founder of Facebook?"
      },
      "4": {
        "correctOptionKey": "1",
        "options": {"1": "Linux", "2": "Windows", "3": "MacOS", "4": "Android"},
        "questionsText":
            "Which operating system is open-source and commonly used in servers?"
      },
      "5": {
        "correctOptionKey": "3",
        "options": {"1": "HTML", "2": "Java", "3": "CSS", "4": "Python"},
        "questionsText":
            "Which language is primarily used to style the layout of a webpage?"
      },
      "6": {
        "correctOptionKey": "2",
        "options": {
          "1": "Google Chrome",
          "2": "Mozilla Firefox",
          "3": "Safari",
          "4": "Internet Explorer"
        },
        "questionsText":
            "Which web browser is known for its open-source nature?"
      },
      "7": {
        "correctOptionKey": "4",
        "options": {"1": "Uber", "2": "Airbnb", "3": "Spotify", "4": "Slack"},
        "questionsText":
            "Which company started as a messaging platform for workplaces and teams?"
      },
      "8": {
        "correctOptionKey": "1",
        "options": {
          "1": "Elon Musk",
          "2": "Jeff Bezos",
          "3": "Bill Gates",
          "4": "Steve Jobs"
        },
        "questionsText": "Who founded Tesla?"
      },
      "9": {
        "correctOptionKey": "2",
        "options": {
          "1": "Smartphone",
          "2": "Tablet",
          "3": "Laptop",
          "4": "Smartwatch"
        },
        "questionsText":
            "What is the most popular mobile computing device used for portable tasks?"
      },
      "10": {
        "correctOptionKey": "4",
        "options": {
          "1": "Cortana",
          "2": "Siri",
          "3": "Alexa",
          "4": "Google Assistant"
        },
        "questionsText": "Which voice assistant is powered by Google?"
      },
      "11": {
        "correctOptionKey": "3",
        "options": {
          "1": "Jupyter",
          "2": "PyCharm",
          "3": "VS Code",
          "4": "Atom"
        },
        "questionsText":
            "Which code editor is highly popular for web development?"
      },
      "12": {
        "correctOptionKey": "1",
        "options": {"1": "HTTP", "2": "FTP", "3": "TCP", "4": "IP"},
        "questionsText":
            "Which protocol is used to transfer hypertext requests over the web?"
      },
      "13": {
        "correctOptionKey": "2",
        "options": {"1": "Intel", "2": "AMD", "3": "ARM", "4": "NVIDIA"},
        "questionsText":
            "Which company is known for its Ryzen series of processors?"
      },
      "14": {
        "correctOptionKey": "3",
        "options": {"1": "Wi-Fi", "2": "Bluetooth", "3": "5G", "4": "NFC"},
        "questionsText":
            "Which technology allows faster mobile internet speed than 4G?"
      },
      "15": {
        "correctOptionKey": "4",
        "options": {
          "1": "Turing Test",
          "2": "Neural Networks",
          "3": "Machine Learning",
          "4": "Artificial Intelligence"
        },
        "questionsText":
            "What is the term for machines that can simulate human-like intelligence?"
      },
      "16": {
        "correctOptionKey": "2",
        "options": {
          "1": "Google Drive",
          "2": "Dropbox",
          "3": "OneDrive",
          "4": "iCloud"
        },
        "questionsText":
            "Which cloud storage service was founded by Drew Houston and Arash Ferdowsi?"
      },
      "17": {
        "correctOptionKey": "1",
        "options": {
          "1": "Google",
          "2": "Microsoft",
          "3": "Facebook",
          "4": "Amazon"
        },
        "questionsText": "Which company acquired YouTube in 2006?"
      },
      "18": {
        "correctOptionKey": "3",
        "options": {
          "1": "Wi-Fi",
          "2": "Ethernet",
          "3": "Bluetooth",
          "4": "Fiber Optics"
        },
        "questionsText":
            "Which wireless technology is commonly used for connecting devices over short distances?"
      },
      "19": {
        "correctOptionKey": "4",
        "options": {"1": "Ruby", "2": "PHP", "3": "JavaScript", "4": "Python"},
        "questionsText":
            "Which programming language is used extensively for machine learning applications?"
      },
      "20": {
        "correctOptionKey": "2",
        "options": {
          "1": "Bluetooth 4.0",
          "2": "Bluetooth 5.0",
          "3": "Bluetooth 3.0",
          "4": "Bluetooth 2.0"
        },
        "questionsText":
            "Which version of Bluetooth supports longer range and faster speeds?"
      },
      "21": {
        "correctOptionKey": "1",
        "options": {
          "1": "Amazon Web Services",
          "2": "Google Cloud",
          "3": "Microsoft Azure",
          "4": "IBM Cloud"
        },
        "questionsText": "Which cloud computing service is offered by Amazon?"
      },
      "22": {
        "correctOptionKey": "3",
        "options": {
          "1": "OpenAI",
          "2": "DeepMind",
          "3": "ChatGPT",
          "4": "TensorFlow"
        },
        "questionsText":
            "Which AI model is developed by OpenAI for natural language processing?"
      },
      "23": {
        "correctOptionKey": "4",
        "options": {
          "1": "Meta",
          "2": "Spotify",
          "3": "Slack",
          "4": "Instagram"
        },
        "questionsText":
            "Which social media platform was acquired by Facebook in 2012?"
      },
      "24": {
        "correctOptionKey": "2",
        "options": {"1": "SQL", "2": "NoSQL", "3": "MySQL", "4": "MongoDB"},
        "questionsText":
            "Which type of database does not use traditional relational database structures?"
      },
      "25": {
        "correctOptionKey": "3",
        "options": {
          "1": "Alexa",
          "2": "Siri",
          "3": "Google Assistant",
          "4": "Cortana"
        },
        "questionsText": "Which voice assistant is provided by Google?"
      },
      "26": {
        "correctOptionKey": "4",
        "options": {
          "1": "Twitter",
          "2": "Instagram",
          "3": "Reddit",
          "4": "TikTok"
        },
        "questionsText":
            "Which social media platform became highly popular for short videos?"
      },
      "27": {
        "correctOptionKey": "1",
        "options": {
          "1": "Adobe Photoshop",
          "2": "CorelDraw",
          "3": "GIMP",
          "4": "Microsoft Paint"
        },
        "questionsText":
            "Which software is widely used for professional photo editing?"
      },
      "28": {
        "correctOptionKey": "2",
        "options": {
          "1": "Nokia",
          "2": "Apple",
          "3": "Samsung",
          "4": "Motorola"
        },
        "questionsText": "Which company introduced the first iPhone in 2007?"
      },
      "29": {
        "correctOptionKey": "3",
        "options": {"1": "Snapchat", "2": "Twitter", "3": "Zoom", "4": "Skype"},
        "questionsText":
            "Which video conferencing tool became extremely popular during the COVID-19 pandemic?"
      }
    }
  },
  "React": {
  "Questions": {
    "0": {
      "correctOptionKey": "1",
      "options": {
        "1": "Facebook",
        "2": "Google",
        "3": "Microsoft",
        "4": "Apple"
      },
      "questionsText": "Which company created React?"
    },
    "1": {
      "correctOptionKey": "2",
      "options": {
        "1": "ReactNative",
        "2": "ReactJS",
        "3": "VueJS",
        "4": "AngularJS"
      },
      "questionsText": "Which library is used for building user interfaces in React?"
    },
    "2": {
      "correctOptionKey": "3",
      "options": {
        "1": "Java",
        "2": "Python",
        "3": "JavaScript",
        "4": "C++"
      },
      "questionsText": "Which programming language is React written in?"
    },
    "3": {
      "correctOptionKey": "4",
      "options": {
        "1": "VueJS",
        "2": "Angular",
        "3": "Ember",
        "4": "React"
      },
      "questionsText": "Which JavaScript library uses a virtual DOM?"
    },
    "4": {
      "correctOptionKey": "2",
      "options": {
        "1": "C#",
        "2": "JSX",
        "3": "HTML",
        "4": "CSS"
      },
      "questionsText": "What syntax is used to describe the UI structure in React?"
    },
    "5": {
      "correctOptionKey": "1",
      "options": {
        "1": "useState",
        "2": "useEffect",
        "3": "useReducer",
        "4": "useContext"
      },
      "questionsText": "Which hook is used to manage state in functional components?"
    },
    "6": {
      "correctOptionKey": "3",
      "options": {
        "1": "getDerivedStateFromProps",
        "2": "componentWillUpdate",
        "3": "componentDidMount",
        "4": "componentWillUnmount"
      },
      "questionsText": "Which lifecycle method is called after the component is mounted?"
    },
    "7": {
      "correctOptionKey": "1",
      "options": {
        "1": "props",
        "2": "state",
        "3": "context",
        "4": "useEffect"
      },
      "questionsText": "What do you call the input to a React component?"
    },
    "8": {
      "correctOptionKey": "4",
      "options": {
        "1": "State",
        "2": "Function",
        "3": "Props",
        "4": "Components"
      },
      "questionsText": "What is the basic building block of a React app?"
    },
    "9": {
      "correctOptionKey": "2",
      "options": {
        "1": "Redux",
        "2": "Context API",
        "3": "useState",
        "4": "useEffect"
      },
      "questionsText": "Which feature in React helps manage global state?"
    },
    "10": {
      "correctOptionKey": "1",
      "options": {
        "1": "JSX",
        "2": "CSS",
        "3": "JavaScript",
        "4": "HTML"
      },
      "questionsText": "Which feature in React allows you to write HTML inside JavaScript?"
    },
    "11": {
      "correctOptionKey": "3",
      "options": {
        "1": "ReactDOM",
        "2": "ReactRouter",
        "3": "ReactNative",
        "4": "ReactJS"
      },
      "questionsText": "Which library allows you to render React applications on web browsers?"
    },
    "12": {
      "correctOptionKey": "2",
      "options": {
        "1": "componentDidMount",
        "2": "useEffect",
        "3": "componentWillUnmount",
        "4": "getDerivedStateFromProps"
      },
      "questionsText": "Which hook is used to run side-effects in React functional components?"
    },
    "13": {
      "correctOptionKey": "4",
      "options": {
        "1": "PropTypes",
        "2": "DefaultProps",
        "3": "RenderProps",
        "4": "Children"
      },
      "questionsText": "What is used to pass data between components in React?"
    },
    "14": {
      "correctOptionKey": "3",
      "options": {
        "1": "state",
        "2": "render",
        "3": "setState",
        "4": "props"
      },
      "questionsText": "Which method is used to update the state in a React class component?"
    },
    "15": {
      "correctOptionKey": "2",
      "options": {
        "1": "Angular",
        "2": "React",
        "3": "Vue",
        "4": "Ember"
      },
      "questionsText": "Which of the following is a framework similar to React?"
    },
    "16": {
      "correctOptionKey": "4",
      "options": {
        "1": "React Native",
        "2": "AngularJS",
        "3": "Vue.js",
        "4": "ReactJS"
      },
      "questionsText": "Which framework is used for building mobile applications using React?"
    },
    "17": {
      "correctOptionKey": "3",
      "options": {
        "1": "create-react-app",
        "2": "webpack",
        "3": "npm",
        "4": "yarn"
      },
      "questionsText": "Which tool is commonly used to create a React app?"
    },
    "18": {
      "correctOptionKey": "1",
      "options": {
        "1": "componentDidMount",
        "2": "componentDidUpdate",
        "3": "useEffect",
        "4": "getSnapshotBeforeUpdate"
      },
      "questionsText": "Which lifecycle method is used to execute code when a component is first rendered?"
    },
    "19": {
      "correctOptionKey": "4",
      "options": {
        "1": "React",
        "2": "JSX",
        "3": "Vue",
        "4": "JavaScript"
      },
      "questionsText": "Which language is React written in?"
    },
    "20": {
      "correctOptionKey": "3",
      "options": {
        "1": "V8",
        "2": "Node.js",
        "3": "ReactDOM",
        "4": "Express.js"
      },
      "questionsText": "Which of the following is used to render React components in the browser?"
    },
    "21": {
      "correctOptionKey": "2",
      "options": {
        "1": "Javascript",
        "2": "CSS-in-JS",
        "3": "TypeScript",
        "4": "Vue.js"
      },
      "questionsText": "Which language can be used with React for styling purposes?"
    },
    "22": {
      "correctOptionKey": "1",
      "options": {
        "1": "ReactJS",
        "2": "ReactRouter",
        "3": "React Native",
        "4": "Redux"
      },
      "questionsText": "Which React library is used for routing in single-page applications?"
    },
    "23": {
      "correctOptionKey": "4",
      "options": {
        "1": "React",
        "2": "Vue.js",
        "3": "Angular",
        "4": "Redux"
      },
      "questionsText": "Which library is used for state management in React?"
    },
    "24": {
      "correctOptionKey": "3",
      "options": {
        "1": "Java",
        "2": "PHP",
        "3": "JavaScript",
        "4": "Ruby"
      },
      "questionsText": "Which programming language is used in React?"
    },
    "25": {
      "correctOptionKey": "1",
      "options": {
        "1": "setState",
        "2": "render",
        "3": "mapStateToProps",
        "4": "getState"
      },
      "questionsText": "Which function is used to update state in a React class component?"
    },
    "26": {
      "correctOptionKey": "4",
      "options": {
        "1": "setState",
        "2": "render",
        "3": "componentDidMount",
        "4": "renderList"
      },
      "questionsText": "What function renders a list of items in React?"
    },
    "27": {
      "correctOptionKey": "2",
      "options": {
        "1": "App.js",
        "2": "index.js",
        "3": "component.js",
        "4": "main.js"
      },
      "questionsText": "Which file is the entry point in a React app?"
    },
    "28": {
      "correctOptionKey": "3",
      "options": {
        "1": "function",
        "2": "props",
        "3": "state",
        "4": "useState"
      },
      "questionsText": "Which keyword is used to represent the internal data of a React component?"
    },
    "29": {
      "correctOptionKey": "1",
      "options": {
        "1": "useEffect",
        "2": "useContext",
        "3": "useReducer",
        "4": "useState"
      },
      "questionsText": "Which React hook is used for side effects in functional components?"
    }
  }
},
"Nepal Driving License": {
  "Questions": {
    "0": {
      "correctOptionKey": "1",
      "options": {
        "1": "18 years",
        "2": "16 years",
        "3": "20 years",
        "4": "21 years"
      },
      "questionsText": "What is the minimum age required to apply for a driving license in Nepal?"
    },
    "1": {
      "correctOptionKey": "3",
      "options": {
        "1": "Blue",
        "2": "Red",
        "3": "Green",
        "4": "Yellow"
      },
      "questionsText": "What color is the traffic light that indicates stop?"
    },
    "2": {
      "correctOptionKey": "4",
      "options": {
        "1": "Right Turn",
        "2": "U-Turn",
        "3": "Left Turn",
        "4": "Overtaking"
      },
      "questionsText": "When can you overtake another vehicle?"
    },
    "3": {
      "correctOptionKey": "2",
      "options": {
        "1": "In the middle of the road",
        "2": "On the right side",
        "3": "On the left side",
        "4": "On the pedestrian lane"
      },
      "questionsText": "Where should you overtake another vehicle?"
    },
    "4": {
      "correctOptionKey": "1",
      "options": {
        "1": "Always",
        "2": "When turning left",
        "3": "When turning right",
        "4": "Never"
      },
      "questionsText": "Should you use the horn when approaching blind corners?"
    },
    "5": {
      "correctOptionKey": "3",
      "options": {
        "1": "7:00 AM to 5:00 PM",
        "2": "9:00 AM to 4:00 PM",
        "3": "6:00 AM to 8:00 PM",
        "4": "All day long"
      },
      "questionsText": "When are the driving license tests conducted in Nepal?"
    },
    "6": {
      "correctOptionKey": "4",
      "options": {
        "1": "In case of an emergency",
        "2": "At a pedestrian crossing",
        "3": "When turning left",
        "4": "When the signal is red"
      },
      "questionsText": "When should you stop at a traffic signal?"
    },
    "7": {
      "correctOptionKey": "2",
      "options": {
        "1": "After turning the engine off",
        "2": "When the pedestrian light is on",
        "3": "When the green light appears",
        "4": "When there is no traffic"
      },
      "questionsText": "When can pedestrians cross the road at a zebra crossing?"
    },
    "8": {
      "correctOptionKey": "3",
      "options": {
        "1": "Pedestrians",
        "2": "Police officers",
        "3": "School buses",
        "4": "Trucks"
      },
      "questionsText": "Who has the right of way when a school bus is stopping?"
    },
    "9": {
      "correctOptionKey": "1",
      "options": {
        "1": "Always",
        "2": "Only during heavy traffic",
        "3": "During nighttime",
        "4": "When no one is around"
      },
      "questionsText": "When should you wear a seatbelt?"
    },
    "10": {
      "correctOptionKey": "2",
      "options": {
        "1": "By tapping the brakes",
        "2": "By signaling with the turn indicator",
        "3": "By honking the horn",
        "4": "By flashing the headlights"
      },
      "questionsText": "How do you signal your intention to turn right?"
    },
    "11": {
      "correctOptionKey": "3",
      "options": {
        "1": "Using a blue warning light",
        "2": "By slowing down",
        "3": "Using an emergency flash",
        "4": "By stopping the vehicle"
      },
      "questionsText": "What should you do when you see an emergency vehicle?"
    },
    "12": {
      "correctOptionKey": "1",
      "options": {
        "1": "40 km/h",
        "2": "50 km/h",
        "3": "60 km/h",
        "4": "70 km/h"
      },
      "questionsText": "What is the general speed limit within city limits in Nepal?"
    },
    "13": {
      "correctOptionKey": "4",
      "options": {
        "1": "10 meters",
        "2": "5 meters",
        "3": "2 meters",
        "4": "0.5 meters"
      },
      "questionsText": "What is the minimum distance you should keep from a pedestrian crossing?"
    },
    "14": {
      "correctOptionKey": "2",
      "options": {
        "1": "Right hand",
        "2": "Left hand",
        "3": "Any hand",
        "4": "Both hands"
      },
      "questionsText": "Which hand should you use to signal a left turn?"
    },
    "15": {
      "correctOptionKey": "3",
      "options": {
        "1": "In front of the car",
        "2": "Behind the car",
        "3": "Inside the car",
        "4": "On the roof"
      },
      "questionsText": "Where should the driver's license be kept while driving?"
    },
    "16": {
      "correctOptionKey": "4",
      "options": {
        "1": "2 hours",
        "2": "3 hours",
        "3": "5 hours",
        "4": "1 hour"
      },
      "questionsText": "How long can you park in a no-parking zone in Nepal?"
    },
    "17": {
      "correctOptionKey": "2",
      "options": {
        "1": "After crossing the white line",
        "2": "Before crossing the white line",
        "3": "On the side of the road",
        "4": "Wherever convenient"
      },
      "questionsText": "Where should you stop at a stop line?"
    },
    "18": {
      "correctOptionKey": "1",
      "options": {
        "1": "A motorcycle",
        "2": "A bicycle",
        "3": "A three-wheeler",
        "4": "A four-wheeler"
      },
      "questionsText": "Which vehicle is prohibited from using the footpath?"
    },
    "19": {
      "correctOptionKey": "4",
      "options": {
        "1": "Trucks",
        "2": "Motorcycles",
        "3": "Cars",
        "4": "Bicycles"
      },
      "questionsText": "Which vehicles should use the bicycle lane?"
    },
    "20": {
      "correctOptionKey": "3",
      "options": {
        "1": "After 8 PM",
        "2": "Before 6 AM",
        "3": "When visibility is poor",
        "4": "During the day"
      },
      "questionsText": "When should you use the headlights during the day?"
    },
    "21": {
      "correctOptionKey": "2",
      "options": {
        "1": "The same lane",
        "2": "The opposite lane",
        "3": "On the sidewalk",
        "4": "In the middle of the road"
      },
      "questionsText": "Where should you not park your vehicle?"
    },
    "22": {
      "correctOptionKey": "4",
      "options": {
        "1": "Always",
        "2": "Only on highways",
        "3": "Only in the morning",
        "4": "Only when necessary"
      },
      "questionsText": "When should you use the horn while driving?"
    },
    "23": {
      "correctOptionKey": "1",
      "options": {
        "1": "Yes",
        "2": "No",
        "3": "Only in rural areas",
        "4": "Only when there is an emergency"
      },
      "questionsText": "Is it mandatory to carry a valid license while driving?"
    },
    "24": {
      "correctOptionKey": "3",
      "options": {
        "1": "Windshield wipers",
        "2": "Seatbelt",
        "3": "Indicator light",
        "4": "Rearview mirror"
      },
      "questionsText": "Which component is important to indicate turns?"
    },
    "25": {
      "correctOptionKey": "2",
      "options": {
        "1": "Rear-view mirror",
        "2": "Side mirror",
        "3": "Window",
        "4": "Dashboard"
      },
      "questionsText": "Which mirror should be adjusted to improve side visibility?"
    },
    "26": {
      "correctOptionKey": "4",
      "options": {
        "1": "Regular intervals",
        "2": "When entering a new lane",
        "3": "Every time you stop",
        "4": "Before overtaking"
      },
      "questionsText": "When should you check the side mirrors?"
    },
    "27": {
      "correctOptionKey": "1",
      "options": {
        "1": "Always",
        "2": "When the roads are empty",
        "3": "In busy traffic",
        "4": "Only in emergencies"
      },
      "questionsText": "When should you use your parking brake?"
    },
    "28": {
      "correctOptionKey": "3",
      "options": {
        "1": "Push the clutch",
        "2": "Press the brake",
        "3": "Press the accelerator",
        "4": "Turn on the headlights"
      },
      "questionsText": "What should you do before starting the engine?"
    },
    "29": {
      "correctOptionKey": "4",
      "options": {
        "1": "Right side of the road",
        "2": "Left side of the road",
        "3": "Middle of the road",
        "4": "Either side"
      },
      "questionsText": "Which side of the road should you drive on in Nepal?"
    }
  }
},

"General Knowledge": {
  "Questions": {
    "0": {
      "correctOptionKey": "1",
      "options": {
        "1": "Albert Einstein",
        "2": "Isaac Newton",
        "3": "Nikola Tesla",
        "4": "Marie Curie"
      },
      "questionsText": "Who developed the theory of relativity?"
    },
    "1": {
      "correctOptionKey": "2",
      "options": {
        "1": "Alexander the Great",
        "2": "Napoleon Bonaparte",
        "3": "Julius Caesar",
        "4": "Genghis Khan"
      },
      "questionsText": "Who was the emperor of France in the early 19th century?"
    },
    "2": {
      "correctOptionKey": "3",
      "options": {
        "1": "Mercury",
        "2": "Venus",
        "3": "Earth",
        "4": "Mars"
      },
      "questionsText": "Which planet is known as the 'Blue Planet'?"
    },
    "3": {
      "correctOptionKey": "4",
      "options": {
        "1": "Einstein",
        "2": "Darwin",
        "3": "Newton",
        "4": "Galileo"
      },
      "questionsText": "Who invented the telescope?"
    },
    "4": {
      "correctOptionKey": "1",
      "options": {
        "1": "France",
        "2": "Germany",
        "3": "Italy",
        "4": "Spain"
      },
      "questionsText": "Which country is known for the Eiffel Tower?"
    },
    "5": {
      "correctOptionKey": "3",
      "options": {
        "1": "Himalayas",
        "2": "Rocky Mountains",
        "3": "Andes",
        "4": "Alps"
      },
      "questionsText": "Which mountain range is the longest in the world?"
    },
    "6": {
      "correctOptionKey": "2",
      "options": {
        "1": "Shakespeare",
        "2": "Charles Dickens",
        "3": "Mark Twain",
        "4": "Jane Austen"
      },
      "questionsText": "Who wrote the novel 'A Tale of Two Cities'?"
    },
    "7": {
      "correctOptionKey": "1",
      "options": {
        "1": "Pacific Ocean",
        "2": "Atlantic Ocean",
        "3": "Indian Ocean",
        "4": "Arctic Ocean"
      },
      "questionsText": "Which is the largest ocean on Earth?"
    },
    "8": {
      "correctOptionKey": "4",
      "options": {
        "1": "Mexico",
        "2": "Canada",
        "3": "Brazil",
        "4": "United States"
      },
      "questionsText": "Which country is home to the White House?"
    },
    "9": {
      "correctOptionKey": "3",
      "options": {
        "1": "Buddhism",
        "2": "Hinduism",
        "3": "Christianity",
        "4": "Islam"
      },
      "questionsText": "Which religion has the largest number of followers worldwide?"
    },
    "10": {
      "correctOptionKey": "2",
      "options": {
        "1": "Jupiter",
        "2": "Saturn",
        "3": "Uranus",
        "4": "Neptune"
      },
      "questionsText": "Which planet is known for its prominent ring system?"
    },
    "11": {
      "correctOptionKey": "1",
      "options": {
        "1": "Mona Lisa",
        "2": "The Scream",
        "3": "Starry Night",
        "4": "The Persistence of Memory"
      },
      "questionsText": "Which famous painting was created by Leonardo da Vinci?"
    },
    "12": {
      "correctOptionKey": "4",
      "options": {
        "1": "Mars",
        "2": "Venus",
        "3": "Jupiter",
        "4": "Saturn"
      },
      "questionsText": "Which planet is known for its Great Red Spot?"
    },
    "13": {
      "correctOptionKey": "3",
      "options": {
        "1": "Einstein",
        "2": "Newton",
        "3": "Darwin",
        "4": "Galileo"
      },
      "questionsText": "Who is known for developing the theory of evolution?"
    },
    "14": {
      "correctOptionKey": "2",
      "options": {
        "1": "Cricket",
        "2": "Football",
        "3": "Basketball",
        "4": "Tennis"
      },
      "questionsText": "Which sport is the most popular in the world?"
    },
    "15": {
      "correctOptionKey": "1",
      "options": {
        "1": "Berlin",
        "2": "Paris",
        "3": "London",
        "4": "Rome"
      },
      "questionsText": "Which city is known for the Brandenburg Gate?"
    },
    "16": {
      "correctOptionKey": "3",
      "options": {
        "1": "Delhi",
        "2": "Mumbai",
        "3": "Kolkata",
        "4": "Chennai"
      },
      "questionsText": "Which city is known as the 'City of Joy'?"
    },
    "17": {
      "correctOptionKey": "4",
      "options": {
        "1": "Shiva",
        "2": "Vishnu",
        "3": "Brahma",
        "4": "Ganesh"
      },
      "questionsText": "Which Hindu deity is known as the remover of obstacles?"
    },
    "18": {
      "correctOptionKey": "2",
      "options": {
        "1": "Mahatma Gandhi",
        "2": "Jawaharlal Nehru",
        "3": "Subhas Chandra Bose",
        "4": "Sardar Patel"
      },
      "questionsText": "Who was the first Prime Minister of India?"
    },
    "19": {
      "correctOptionKey": "3",
      "options": {
        "1": "Mexico",
        "2": "Italy",
        "3": "Japan",
        "4": "Germany"
      },
      "questionsText": "Which country is home to Mount Fuji?"
    },
    "20": {
      "correctOptionKey": "1",
      "options": {
        "1": "English",
        "2": "Spanish",
        "3": "French",
        "4": "Chinese"
      },
      "questionsText": "Which language is spoken by the most people worldwide?"
    },
    "21": {
      "correctOptionKey": "4",
      "options": {
        "1": "China",
        "2": "India",
        "3": "United States",
        "4": "Russia"
      },
      "questionsText": "Which country has the largest land area in the world?"
    },
    "22": {
      "correctOptionKey": "2",
      "options": {
        "1": "Amazon",
        "2": "Nile",
        "3": "Ganges",
        "4": "Yangtze"
      },
      "questionsText": "Which is the longest river in the world?"
    },
    "23": {
      "correctOptionKey": "1",
      "options": {
        "1": "Vincent van Gogh",
        "2": "Pablo Picasso",
        "3": "Claude Monet",
        "4": "Andy Warhol"
      },
      "questionsText": "Who painted 'Starry Night'?"
    },
    "24": {
      "correctOptionKey": "3",
      "options": {
        "1": "Abraham Lincoln",
        "2": "George Washington",
        "3": "Thomas Jefferson",
        "4": "Theodore Roosevelt"
      },
      "questionsText": "Who was the 3rd President of the United States?"
    },
    "25": {
      "correctOptionKey": "2",
      "options": {
        "1": "Egypt",
        "2": "Greece",
        "3": "Italy",
        "4": "Turkey"
      },
      "questionsText": "Which country is home to the ancient ruins of the Parthenon?"
    },
    "26": {
      "correctOptionKey": "4",
      "options": {
        "1": "Titanic",
        "2": "Independence Day",
        "3": "Avatar",
        "4": "Jurassic Park"
      },
      "questionsText": "Which movie is known for featuring dinosaurs in its storyline?"
    },
    "27": {
      "correctOptionKey": "3",
      "options": {
        "1": "1998",
        "2": "2005",
        "3": "2001",
        "4": "1995"
      },
      "questionsText": "In which year did the terrorist attacks of September 11 occur?"
    },
    "28": {
      "correctOptionKey": "1",
      "options": {
        "1": "India",
        "2": "Nepal",
        "3": "China",
        "4": "Pakistan"
      },
      "questionsText": "Which country is home to the Taj Mahal?"
    },
    "29": {
      "correctOptionKey": "2",
      "options": {
        "1": "Himalayas",
        "2": "Rocky Mountains",
        "3": "Andes",
        "4": "Alps"
      },
      "questionsText": "Which mountain range is primarily located in the western part of North America?"
    }
  }
}



};
