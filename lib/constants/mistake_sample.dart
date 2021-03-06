import '../models/sentence.dart';

/// If API isn't working then connect to Mock API and show [numberSamplePerPage] samples.
const numberSamplePerPage = 10;

/// List of samples that Mock API will use.
final List<Sentence> apiSample = [
  Sentence(
    label: 'SPOKN1',
    text: 'This solution isn\'t the most effective one.',
    suggestion: 'Using contractions',
    error: 'n\'t',
  ),
  Sentence(
    label: 'SPOKN1',
    text: 'There are three ways to solve this problem.',
    suggestion: 'Using forms of there is/are',
    error: 'There are',
  ),
  Sentence(
    label: 'SPOKN1',
    text: 'There are three ways to solve this problem.',
    suggestion: 'Using forms of there is/are',
    error: 'There are',
  ),
  Sentence(
    label: 'VOCAB5',
    text: 'this is good.',
    suggestion: 'using a forbidden words',
    error: 'good',
  ),
  Sentence(
    label: 'VOCAB5',
    text: 'this is bad.',
    suggestion: 'using a forbidden words',
    error: 'bad',
  ),
  Sentence(
    label: 'VOCAB5',
    text:
        'The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.',
    suggestion: 'using a forbidden words',
    error: 'like',
  ),
  Sentence(
    label: 'VOCAB5',
    text:
        'The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.',
    suggestion: 'using a forbidden words',
    error: 'like',
  ),
  Sentence(
    label: 'VOCAB5',
    text:
        'The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.',
    suggestion: 'using a forbidden words',
    error: 'like',
  ),
  Sentence(
    error: 'you',
    text:
        'We will consider two products about which you can find enough information on the Internet.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'You',
    text: 'You should be aware of the drawbacks of the system.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'huge',
    text:
        'As a result, I get a huge amount of unneeded connections that I could not filter out.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'process',
    text:
        'The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'utilize',
    text: 'OR-Tools model utilize only the CPU',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'you',
    text:
        'We will consider two products about which you can find enough information on the Internet.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'You',
    text: 'You should be aware of the drawbacks of the system.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'necessary',
    text: 'The necessary data are difficult to obtain.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'very',
    text: 'React is a very lightweight library.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'bad',
    text: 'The device performance is bad.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'good',
    text: 'This design is good.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'Also',
    text:
        'Also, React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, etc.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'and so on',
    text:
        'React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.',
    label: 'SPOKN1',
    suggestion: 'Preferring and so on to etc.',
  ),
  Sentence(
    error: 'for model',
    text:
        'The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.',
    label: 'WORDNES3',
    suggestion:
        'Describing purpose through the use of for + noun or for + gerund',
  ),
  Sentence(
    error: 'In order to',
    text:
        'In order to protect the system, a developer must provide a different solution.',
    label: 'WORDNES3',
    suggestion: 'Using in order to',
  ),
  Sentence(
    error: 'a number of',
    text: 'This problem has a number of solutions.',
    label: 'WORDNES3',
    suggestion: 'Using a number of',
  ),
  Sentence(
    error: 'We',
    text:
        'We will consider two products about which you can find enough information on the Internet.',
    label: 'PRONOUN4',
    suggestion: 'Using pronoun incorrectly',
  ),
  Sentence(
    error: 'I',
    text:
        'The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.',
    label: 'PRONOUN4',
    suggestion: 'Using pronoun incorrectly',
  ),
  Sentence(
    error: 'I',
    text:
        'To reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.',
    label: 'PRONOUN4',
    suggestion: 'Using pronoun incorrectly',
  ),
  Sentence(
    error: 'about 100',
    text: 'The student has collected about 100 examples.',
    label: 'DIGIT8',
    suggestion: 'Providing tentative facts and figures',
  ),
  Sentence(
    error: '4',
    text: '4 of them work in a company for more than a year.',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: '4 of',
    text: '4 of them work in a company for more than a year.',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: '3',
    text: 'This approach has 3 techniques.',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: '10',
    text: 'This design was 10 times more efficient.',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: '1',
    text: 'The student has collected about [1]',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: '',
    text:
        '\nTo reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.',
    label: 'WORDNES3',
    suggestion:
        'A very long sentence having over 2 clauses and being over 3 lines long',
  ),
  Sentence(
    error: 'n\'t',
    text:
        'Lastly, students like to ask questions right away, and they don\'t mind if their colleagues answered the questions instead of the teacher.',
    label: 'SPOKN1',
    suggestion: 'Using contractions',
  ),
  Sentence(
    error: 'like',
    text:
        'Needless to say, most universities have changed their teaching to be more like a wide angle to enhance online education.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'good',
    text:
        'Second, how can we validate if we are doing a good job with online education?',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'best',
    text:
        'where the goal of single choice questions is, to make sure what teaching styles best suit students besides what tools they prefer to use in an online learning context.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'very',
    text: 'Vlog is very much well received by the students *',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'best',
    text: 'What will be the best quality and duration?',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'Also',
    text:
        'Also, showing the Instructor\'s face is preferable to students although it can introduce some kind of distraction.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'like',
    text:
        'Lastly, students like to ask questions right away, and they don\'t mind if their colleagues answered the questions instead of the teacher.',
    label: 'VOCAB5',
    suggestion: 'using a forbidden words',
  ),
  Sentence(
    error: 'for software',
    text:
        'the results are particularly interesting for software development since they resemble a lot of lean approaches to software development [2].',
    label: 'WORDNES3',
    suggestion:
        'Describing purpose through the use of for + noun or for + gerund',
  ),
  Sentence(
    error: 'for instance',
    text: 'for instance, using a digital pen and drafting on screen.',
    label: 'WORDNES3',
    suggestion:
        'Describing purpose through the use of for + noun or for + gerund',
  ),
  Sentence(
    error: 'for students',
    text:
        '* Allowing questions for students affects other students positively.',
    label: 'WORDNES3',
    suggestion:
        'Describing purpose through the use of for + noun or for + gerund',
  ),
  Sentence(
    error: 'for students',
    text:
        'Lastly, Youtube chapters have shown great attention for students and they found that dividing the videos into sections helps a lot, especially during homework.',
    label: 'WORDNES3',
    suggestion:
        'Describing purpose through the use of for + noun or for + gerund',
  ),
  Sentence(
    error: 'We',
    text: 'We have got 115 respondents.',
    label: 'PRONOUN4',
    suggestion: 'Using pronoun incorrectly',
  ),
  Sentence(
    error: 'we',
    text:
        'To sum up, we should mention that the data was collected anonymously and with the permission of the department of education of the university.',
    label: 'PRONOUN4',
    suggestion: 'Using pronoun incorrectly',
  ),
  Sentence(
    error: '2 years',
    text:
        'Therefore, teachers started to use online technologies to provide educational material to students for almost 2 years.',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: '2',
    text:
        'Therefore, teachers started to use online technologies to provide educational material to students for almost 2 years.',
    label: 'DIGIT8',
    suggestion: 'Using digits for numbers below 11',
  ),
  Sentence(
    error: 'Second,',
    text:
        'Second, we formulated the questions and distributed them among students.',
    label: 'DIGIT8',
    suggestion: 'Starting a sentence with a digit.',
  ),
  Sentence(
    error: '',
    text:
        'Figure 2 - Single choice questions References [1]   M. J. Phipps, R., ???What???s the difference?a review of contemporary research the effectiveness of distance learning in higher education,??? Washington, DC: Institute forHigher Education Policy, 1990 [2] G. Marino and G. Succi, ???Data Structures for Parallel Execution of Functional Languages,??? in Proceedings of the Parallel Architectures and Languages Europe, Volume II: Parallel Languages, ser. PARLE ???89.',
    label: 'WORDNES3',
    suggestion:
        'A very long sentence having over 2 clauses and being over 3 lines long',
  ),
];

// jsons

// final String json3 =
//     '[{"match":"n\'t","sentence":"Lastly, students like to ask questions right away, and they don\'t mind if their colleagues answered the questions instead of the teacher.","label":"SPOKN1","description":"Using contractions"},{"match":"like","sentence":"Needless to say, most universities have changed their teaching to be more like a wide angle to enhance online education.","label":"VOCAB5","description":"using a forbidden words"},{"match":"good","sentence":"Second, how can we validate if we are doing a good job with online education?","label":"VOCAB5","description":"using a forbidden words"},{"match":"best","sentence":"where the goal of single choice questions is, to make sure what teaching styles best suit students besides what tools they prefer to use in an online learning context.","label":"VOCAB5","description":"using a forbidden words"},{"match":"very","sentence":"Vlog is very much well received by the students *","label":"VOCAB5","description":"using a forbidden words"},{"match":"best","sentence":"What will be the best quality and duration?","label":"VOCAB5","description":"using a forbidden words"},{"match":"Also","sentence":"Also, showing the Instructor\'s face is preferable to students although it can introduce some kind of distraction.","label":"VOCAB5","description":"using a forbidden words"},{"match":"like","sentence":"Lastly, students like to ask questions right away, and they don\'t mind if their colleagues answered the questions instead of the teacher.","label":"VOCAB5","description":"using a forbidden words"},{"match":"for software","sentence":"the results are particularly interesting for software development since they resemble a lot of lean approaches to software development [2].","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for instance","sentence":"for instance, using a digital pen and drafting on screen.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for students","sentence":"* Allowing questions for students affects other students positively.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for students","sentence":"Lastly, Youtube chapters have shown great attention for students and they found that dividing the videos into sections helps a lot, especially during homework.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"we","sentence":"What have we learned from Covid-19 Muwaffaq Imam Innopolis University, May 2021","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Thus, taking advantage of this collected data to enhance education either by bringing some of the new methods we learned from online education to the on-site learning, or keep using it in the online learning if needed.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Our hypothesis was First, how can we enhance online education?","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Second, how can we validate if we are doing a good job with online education?","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Second, how can we validate if we are doing a good job with online education?","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"To answer our research questions first we decided to collect data through a survey form.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"That being the case, first, we looked at previous research done in this area.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Second, we formulated the questions and distributed them among students.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Third, we analyzed the data and came up with a set of lessons learned on how to improve our online education and the tools that the faculty uses.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We have got 115 respondents.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"The Result of Videos enhancement category answers questions such as how can we enhance our educational videos?","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"To sum up, we should mention that the data was collected anonymously and with the permission of the department of education of the university.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"2021 At","sentence":"What have we learned from Covid-19 Muwaffaq Imam Innopolis University, May 2021","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"2","sentence":"Therefore, teachers started to use online technologies to provide educational material to students for almost 2 years.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2 years","sentence":"Therefore, teachers started to use online technologies to provide educational material to students for almost 2 years.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"[1].","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"the results are particularly interesting for software development since they resemble a lot of lean approaches to software development [2].","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"Second,","sentence":"Second, how can we validate if we are doing a good job with online education?","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"Third,","sentence":"Third, How effective is the use of our tools towards the education of the students?","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"Second,","sentence":"Second, we formulated the questions and distributed them among students.","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"Third,","sentence":"Third, we analyzed the data and came up with a set of lessons learned on how to improve our online education and the tools that the faculty uses.","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"3","sentence":"Primarily, The research question was formulated with contrasting not on establishing the optimal faculty but keeping in mind the students feeling as well [3].","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"4","sentence":"[4].","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"First,","sentence":"First, is the Multichoice questions demonstrated in Figure 1.","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"1","sentence":"First, is the Multichoice questions demonstrated in Figure 1.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1.","sentence":"First, is the Multichoice questions demonstrated in Figure 1.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"Second,","sentence":"Second, single choice questions are demonstrated in Figure 2.","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"2","sentence":"Second, single choice questions are demonstrated in Figure 2.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2.","sentence":"Second, single choice questions are demonstrated in Figure 2.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"10","sentence":"* Video duration should be from 10 to 15 minutes.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"10 to","sentence":"* Video duration should be from 10 to 15 minutes.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"Figure 1 - Multi choice questions","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1 -","sentence":"Figure 1 - Multi choice questions","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"Figure 2 - Single choice questions References [1]   M. J. Phipps, R., ???What???s the difference?a review of contemporary research the effectiveness of distance learning in higher education,??? Washington, DC: Institute forHigher Education Policy, 1990 [2] G. Marino and G. Succi, ???Data Structures for Parallel Execution of Functional Languages,??? in Proceedings of the Parallel Architectures and Languages Europe, Volume II: Parallel Languages, ser. PARLE ???89.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2 -","sentence":"Figure 2 - Single choice questions References [1]   M. J. Phipps, R., ???What???s the difference?a review of contemporary research the effectiveness of distance learning in higher education,??? Washington, DC: Institute forHigher Education Policy, 1990 [2] G. Marino and G. Succi, ???Data Structures for Parallel Execution of Functional Languages,??? in Proceedings of the Parallel Architectures and Languages Europe, Volume II: Parallel Languages, ser. PARLE ???89.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"Figure 2 - Single choice questions References [1]   M. J. Phipps, R., ???What???s the difference?a review of contemporary research the effectiveness of distance learning in higher education,??? Washington, DC: Institute forHigher Education Policy, 1990 [2] G. Marino and G. Succi, ???Data Structures for Parallel Execution of Functional Languages,??? in Proceedings of the Parallel Architectures and Languages Europe, Volume II: Parallel Languages, ser. PARLE ???89.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"Figure 2 - Single choice questions References [1]   M. J. Phipps, R., ???What???s the difference?a review of contemporary research the effectiveness of distance learning in higher education,??? Washington, DC: Institute forHigher Education Policy, 1990 [2] G. Marino and G. Succi, ???Data Structures for Parallel Execution of Functional Languages,??? in Proceedings of the Parallel Architectures and Languages Europe, Volume II: Parallel Languages, ser. PARLE ???89.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3","sentence":"[3] J. R. Young, ???Using social media technologies to enhance online learning,??? Mary- land colleges train professors to teach online,","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"4","sentence":"[4] D. H. Pink, ???Managing humour,??? Journal of Management Studies, pp. 269??? 288, 2006","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"","sentence":"Figure 2 - Single choice questions References [1]   M. J. Phipps, R., ???What???s the difference?a review of contemporary research the effectiveness of distance learning in higher education,??? Washington, DC: Institute forHigher Education Policy, 1990 [2] G. Marino and G. Succi, ???Data Structures for Parallel Execution of Functional Languages,??? in Proceedings of the Parallel Architectures and Languages Europe, Volume II: Parallel Languages, ser. PARLE ???89.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"}]';
// final String json2 = '[{"match":"there are","sentence":"Now, there are multiple types of Neural Networks (G\u00e9ron 2019).","label":"SPOKN1","description":"Using forms of there is\/are"},{"match":"there are","sentence":"Conclusions:In conclusion, it is evident that Artificial Intelligence is in its infancy in the UAE, and there are abundant opportunities to develop this innovative technology not only in business organizations but also in government institutions.","label":"SPOKN1","description":"Using forms of there is\/are"},{"match":"there are","sentence":"Although there are some inherent barriers that may impede this development, this is a topic of high importance because in the contemporary globalized world economy firm success will depend on adopting innovations to retain a competitive edge.","label":"SPOKN1","description":"Using forms of there is\/are"},{"match":"processes","sentence":"Artificial intelligence (AI) and machine learning can be used to augment and enhance the cognitive capabilities of strategic and operational managers or be used to automate business processes increasing the efficiency and performance of business organizations and providing them with a more favorable competitive position.","label":"VOCAB5","description":"using a forbidden words"},{"match":"processes","sentence":"Given this phenomenon, AI can be used to augment business operations, for example embedding algorithms to applications that support organizational processes or automating repetitive and formulaic tasks providing improvements in the speed of information analysis and the reliability and accuracy of outputs (Tarafdar 2019).","label":"VOCAB5","description":"using a forbidden words"},{"match":"goods","sentence":"Theoretical BackgroundConceptual Framework:The long-term success and competitive position of a business organization is reliant on the ability of its operational function to provide customers with goods and services more effectively, efficiently, and sustainably than its competitors in the market.","label":"VOCAB5","description":"using a forbidden words"},{"match":"process","sentence":"They are performance management, employee engagement, process management, strategy development, organizational planning, and improvement initiatives.","label":"VOCAB5","description":"using a forbidden words"},{"match":"process","sentence":"For process management the applications are risk management, standardization and auditing, lean management, and problem-solving tools.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"These twenty-four variables were chosen not only as the basis for the benchmark but were also used to design the survey that was completed by the strategic or operational managers in the chosen companies.","label":"VOCAB5","description":"using a forbidden words"},{"match":"very","sentence":"So far there is no progress in this field and it is still very much far away from being implemented.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"Machine Learning Machine learning is the science where the machine learns from data, which means that you give the machine input and output and the machine\'s job is to learn how the given input results with this output.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"Besides you can use the program to predict the output based on the given input.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"In Supervised learning, the input data you feed to the algorithm must be labeled to supervise the learning.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"for example, if you want to create an email spam filtering application, you have to provide emails labeled either spam or not spam and make the machine train on this data.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"for example, if you want to create an email spam filtering application, you have to provide emails labeled either spam or not spam and make the machine train on this data.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"For instance, you can give the system uncategorized data, and the machine will try to structure a pattern between the data and cluster them together in groups.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"Some essential libraries and tools in Machine learning are Numpy, Panda, Matplotlib, and Jupyter notebook which is a tool that can allow you to write blocks of codes and blocks of texts.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"you can run these blocks sequentially at any time.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"It can help in machine learning projects since you can write blocks that can take time, for example, training the model and running it once then you can run any other faster block without the need to wait for the time-consuming block of code.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"It can help in machine learning projects since you can write blocks that can take time, for example, training the model and running it once then you can run any other faster block without the need to wait for the time-consuming block of code.","label":"VOCAB5","description":"using a forbidden words"},{"match":"processing","sentence":"Deep learning Deep learning is a term that engineers use when they want to refer to a Neural Network which they are the core of Deep learning and they are powerful and scalable making them ready to overcome complex machine learning projects such as classifying and processing billion of colorful images, recommend millions of users to buy or to watch something, or even learning a board game and beating it (G\u00e9ron 2019).","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"Recurrent neural networks (RNN) can at some point predict the future, they are capable of analyzing time series of the stock market and telling you when to sell or buy.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"They can also help avoid crashes in autonomous driving by anticipating car trajectories.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"It\'s also capable of providing image captions and generating sentences (G\u00e9ron 2019).","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"AI applications can also be categorized into two parts 1) Computer vision where it\u2019s a subfield of AI that infer meaningful information from images, videos or any other visual inputs.","label":"VOCAB5","description":"using a forbidden words"},{"match":"good","sentence":"They have found that using a Convolutional Neural Network has demonstrated good detection, tracking, and counting of the eggs in the facility.","label":"VOCAB5","description":"using a forbidden words"},{"match":"very","sentence":"In conclusion, we can dictate that AI can be applied in a variety of fields and we are still very young in taking advantage of this field, and yet far from fully exploiting it completely.","label":"VOCAB5","description":"using a forbidden words"},{"match":"process","sentence":"Instrumentation:The data collection process entailed a survey that measured the twenty-four points relating to the six five core functionalities shown below:Performance management (PM): decision automation, objectives management, key actions, and management transparency.","label":"VOCAB5","description":"using a forbidden words"},{"match":"Process","sentence":"Process management (PM): risk management, standardization and auditing, lean management, and problem-solving tools.","label":"VOCAB5","description":"using a forbidden words"},{"match":"process","sentence":"The Data Gathering Process & Ethical Considerations:The first step of the data gathering process entailed identifying the firms within the selected industries that were using Artificial Intelligence applications in their organizational mandate.","label":"VOCAB5","description":"using a forbidden words"},{"match":"very","sentence":"The managers that did complete the surveys represented for the most part very significant firms in the industries selected.","label":"VOCAB5","description":"using a forbidden words"},{"match":"processed","sentence":"Data Analysis:ResultsThe primary data that was collected from the surveys was processed using the SPSS 22 software.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"This will indicate the present AI utilization and will also indicate the industries that are underdeveloped in this field.","label":"VOCAB5","description":"using a forbidden words"},{"match":"best","sentence":"Strategic planning refers to constantly adapting the direction of a company toward the best possible fit in the changing business environment.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"Lack of Skills can also be a barrier for many companies because they may not have access to the specialists and training required for AI integration.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"Consequently, further development if this innovative technology which is one of the main drivers of the fourth industrial revolution will not only have a positive impact on the competitive position of firms operating in the UAE, but also applies to firms operating anywhere in the world.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"Conclusions:In conclusion, it is evident that Artificial Intelligence is in its infancy in the UAE, and there are abundant opportunities to develop this innovative technology not only in business organizations but also in government institutions.","label":"VOCAB5","description":"using a forbidden words"},{"match":"also","sentence":"Furthermore firms in the UAE are not only competing locally but also globally and thus must attain international levels of innovation and operational excellence.","label":"VOCAB5","description":"using a forbidden words"},{"match":"good","sentence":"Demystifying the Draft EU Artificial Intelligence Act\u2014Analysing the good, the bad, and the unclear elements of the proposed approach.","label":"VOCAB5","description":"using a forbidden words"},{"match":"bad","sentence":"Demystifying the Draft EU Artificial Intelligence Act\u2014Analysing the good, the bad, and the unclear elements of the proposed approach.","label":"VOCAB5","description":"using a forbidden words"},{"match":"for example","sentence":"Given this phenomenon, AI can be used to augment business operations, for example embedding algorithms to applications that support organizational processes or automating repetitive and formulaic tasks providing improvements in the speed of information analysis and the reliability and accuracy of outputs (Tarafdar 2019).","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for operating","sentence":"The framework of the core functionalities for operating excellence is a more novel conceptual model and is illustrated in Figure 1(Poulin et al 2021).","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"For performance","sentence":"For performance management, the applications are decision automation, objectives management, key actions, and management transparency.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"For employee","sentence":"For employee engagement applications are leadership and coaching, rewards and recognition, time management, and people development.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"For process","sentence":"For process management the applications are risk management, standardization and auditing, lean management, and problem-solving tools.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"For improvement","sentence":"For improvement initiatives the applications are continuous improvement, innovation, transformation planning, and the value chain analysis (Poulin et al 2021).","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for example","sentence":"for example, if you want to create an email spam filtering application, you have to provide emails labeled either spam or not spam and make the machine train on this data.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"For instance","sentence":"For instance, you can give the system uncategorized data, and the machine will try to structure a pattern between the data and cluster them together in groups.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for example","sentence":"It can help in machine learning projects since you can write blocks that can take time, for example, training the model and running it once then you can run any other faster block without the need to wait for the time-consuming block of code.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for development","sentence":"This look at the differences between the various sectors indicates that the potential for development and potential gains in competitive position of certain industries are higher than others.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for experts","sentence":"The demands of various industries for experts in this field has skyrocketed making it unattainable for many companies either from a financial perspective, or from an availability perspective.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for development","sentence":"The outcome of this study has shown that there is much room for development and AI integration across industries.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for management","sentence":"AI for management: An overview.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for data","sentence":"Introduction to machine learning with Python: A guide for data scientists.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"for information","sentence":"A contextual model for information extraction in resume analytics using NLP\u2019s spacy doi:10.1007\/978-981-33-4305-4_30Ulaszewski, M., Janowski, R., & Janowski, A. (2021).","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"you","sentence":"Machine Learning Machine learning is the science where the machine learns from data, which means that you give the machine input and output and the machine\'s job is to learn how the given input results with this output.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Furthermore, The difference between machine learning and software development is that in software development we use input and write programs to produce output.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"While in Machine learning we have input and output and the machine will learn the program by itself.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"Besides you can use the program to predict the output based on the given input.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"In Supervised learning, the input data you feed to the algorithm must be labeled to supervise the learning.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"for example, if you want to create an email spam filtering application, you have to provide emails labeled either spam or not spam and make the machine train on this data.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"for example, if you want to create an email spam filtering application, you have to provide emails labeled either spam or not spam and make the machine train on this data.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"For instance, you can give the system uncategorized data, and the machine will try to structure a pattern between the data and cluster them together in groups.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"Some essential libraries and tools in Machine learning are Numpy, Panda, Matplotlib, and Jupyter notebook which is a tool that can allow you to write blocks of codes and blocks of texts.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"you can run these blocks sequentially at any time.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"It can help in machine learning projects since you can write blocks that can take time, for example, training the model and running it once then you can run any other faster block without the need to wait for the time-consuming block of code.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"It can help in machine learning projects since you can write blocks that can take time, for example, training the model and running it once then you can run any other faster block without the need to wait for the time-consuming block of code.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"Recurrent neural networks (RNN) can at some point predict the future, they are capable of analyzing time series of the stock market and telling you when to sell or buy.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"In conclusion, we can dictate that AI can be applied in a variety of fields and we are still very young in taking advantage of this field, and yet far from fully exploiting it completely.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"In conclusion, we can dictate that AI can be applied in a variety of fields and we are still very young in taking advantage of this field, and yet far from fully exploiting it completely.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"In Fact, we are in the era of starting to use its application to raise humans to another dimension.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"Privacy is always a concern in this type of study, so all participants we assured complete anonymity and privacy concerning their identities and the results of the surveys.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We can see that artificial intelligence is a mostly used in the manufacturing sector followed by the logistics sector then the wholesale and retail sector, and then the financial insurance sector finally the real estate sector is the least developed in AI integration.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"we","sentence":"The role of artificial intelligence and machine learning amid the COVID 19 pandemic: What lessons are we learning on 4IR and the sustainable development goals.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"2","sentence":"The framework discussed above has been further developed to include the various applications of artificial intelligence within each core functionality and is illustrated in Figure 2 (Poulin et al 2021).","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2 (","sentence":"The framework discussed above has been further developed to include the various applications of artificial intelligence within each core functionality and is illustrated in Figure 2 (Poulin et al 2021).","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3","sentence":"To sum up, AI is a broad field of Computer science, Machine learning is considered to be a subfield of AI, and Deep learning is considered to be a subfield of Machine learning as shown in the Venn diagram in Figure 3.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3.","sentence":"To sum up, AI is a broad field of Computer science, Machine learning is considered to be a subfield of AI, and Deep learning is considered to be a subfield of Machine learning as shown in the Venn diagram in Figure 3.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3","sentence":"Machine learning systems can be categorized according to the way how machines learn into 3 categories (G\u00e9ron 2019): Supervised Learning, Unsupervised Learning, and Reinforcement Learning.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3 categories","sentence":"Machine learning systems can be categorized according to the way how machines learn into 3 categories (G\u00e9ron 2019): Supervised Learning, Unsupervised Learning, and Reinforcement Learning.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"AI applications can also be categorized into two parts 1) Computer vision where it\u2019s a subfield of AI that infer meaningful information from images, videos or any other visual inputs.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1)","sentence":"AI applications can also be categorized into two parts 1) Computer vision where it\u2019s a subfield of AI that infer meaningful information from images, videos or any other visual inputs.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"2)","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"2","sentence":"2)","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2)","sentence":"2)","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"2)","sentence":"2)","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"The primary data collected from the surveys is shown below in table 1.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1.","sentence":"The primary data collected from the surveys is shown below in table 1.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"Table 1 \u2013 Percentage Utilization of AI per companyIn the table below there is a significant variance in AI adoption in the five prevalent industries operating in the UAE.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1 \u2013","sentence":"Table 1 \u2013 Percentage Utilization of AI per companyIn the table below there is a significant variance in AI adoption in the five prevalent industries operating in the UAE.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"Table 2 - Descriptive statistics breakdown per industryDiscussionThe focus of the research conducted in this study is to provide insight into AI proliferation in various prominent industries operating in the UAE.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2 -","sentence":"Table 2 - Descriptive statistics breakdown per industryDiscussionThe focus of the research conducted in this study is to provide insight into AI proliferation in various prominent industries operating in the UAE.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"One of","sentence":"One of the first limitations of the study is that the chosen companies in the sample were in Dubai.","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"2","sentence":" Arab Economic and Business Journal, 14(1), 2-7.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2-","sentence":" Arab Economic and Business Journal, 14(1), 2-7.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"7","sentence":" Arab Economic and Business Journal, 14(1), 2-7.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"7.","sentence":" Arab Economic and Business Journal, 14(1), 2-7.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"36","sentence":"36-40).","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"36-","sentence":"36-40).","label":"DIGIT8","description":"Starting a sentence with a digit."},{"match":"3","sentence":"the Future of Management in an AI World, 3-19.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3-","sentence":"the Future of Management in an AI World, 3-19.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"Raisch, S. and Krakowski, S., \u201cArtificial Intelligence and Management: The Automation-Augmentation Paradox,\u201d Academy of Management Review 46, no. 1 (January 2021): 192 - 210   Tarafdar, M., Beath, C. M., & Ross, J. W. (2019).","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1 (","sentence":"Raisch, S. and Krakowski, S., \u201cArtificial Intelligence and Management: The Automation-Augmentation Paradox,\u201d Academy of Management Review 46, no. 1 (January 2021): 192 - 210   Tarafdar, M., Beath, C. M., & Ross, J. W. (2019).","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3","sentence":"Automation of software system development using natural language processing and two-level grammar doi:10.1007\/978-3-540-24626-8_15Channabasamma, Suresh, Y., & Manusha Reddy, A. (2021).","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3-","sentence":"Automation of software system development using natural language processing and two-level grammar doi:10.1007\/978-3-540-24626-8_15Channabasamma, Suresh, Y., & Manusha Reddy, A. (2021).","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"doi:10.5565\/rev\/elcvia.1390\fFigure 1.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1.","sentence":"doi:10.5565\/rev\/elcvia.1390\fFigure 1.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"(Poulin et al 2021)\fFigure 2.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2.","sentence":"(Poulin et al 2021)\fFigure 2.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"\fTable 1 \u2013 Percentage Utilization of AI per companyTable 2 - Descriptive statistics breakdown per industry","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1 \u2013","sentence":"\fTable 1 \u2013 Percentage Utilization of AI per companyTable 2 - Descriptive statistics breakdown per industry","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2","sentence":"\fTable 1 \u2013 Percentage Utilization of AI per companyTable 2 - Descriptive statistics breakdown per industry","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"2 -","sentence":"\fTable 1 \u2013 Percentage Utilization of AI per companyTable 2 - Descriptive statistics breakdown per industry","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"","sentence":"\nDr. Samer Kobrossy\nAssociate Professor, American University in the Emirates, Dubai-UAE\n+971 52 418 3435, samer.kobrossy@aue.ae \n\nDr. Riad El Chami\nAssociate Professor, American University in the Emirates, Dubai-UAE\n+971 58 565 6909, riad.alchami@aue.ae.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"From a practical perspective, this study will provide insight into the level of AI development in business organizations operating in prominent industries in the UAE, and the positive impact that further AI development can have on their competitive position in the contemporary globalized marketplace.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Based on the survey results the AI activities were individually identified, and these results were then benchmarked using the Artificial intelligence-based operational excellence framework in each of the five chosen industries (Poulin 2021).","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":" \nKey Observations\/Results: The results indicate that AI use varies among industries but is still in its infancy in the UAE, and further integration of this innovative technology will help local firms gain a competitive advantage in the global marketplace.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"The findings from this study can facilitate business academicians and practitioners in gaining a better understanding of current AI integration in the UAE and provide insight into how to leverage this innovative technology in the future to increase their efficiency, effectiveness, and sustainability which will ultimately improve their competitive position on a global level.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Artificial intelligence (AI) and machine learning can be used to augment and enhance the cognitive capabilities of strategic and operational managers or be used to automate business processes increasing the efficiency and performance of business organizations and providing them with a more favorable competitive position.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"The dynamic nature of the contemporary business environment and the changes coming about by the fourth industrial revolution driven by developments in AI and other technologies will bring shifts in power, wealth, and knowledge (Mahomed 2018).","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Given this phenomenon, AI can be used to augment business operations, for example embedding algorithms to applications that support organizational processes or automating repetitive and formulaic tasks providing improvements in the speed of information analysis and the reliability and accuracy of outputs (Tarafdar 2019).","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nEven though the last decade has seen considerable growth in the use of AI in business organizations ranging from operations management and supply chain to marketing and sales (Gil et al. 2020), it is evident that there is limited research addressing this innovation concerning business organizations operating in the United Arab Emirates.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nThe research that will be conducted in this study seeks to gauge the levels of AI utilization by UAE firms compared to the benchmark as defined by the artificial intelligence-based operational excellence framework across various prevalent industries (Poulin 2021).","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\n\nTheoretical Background\nConceptual Framework:\nThe long-term success and competitive position of a business organization is reliant on the ability of its operational function to provide customers with goods and services more effectively, efficiently, and sustainably than its competitors in the market.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Many contemporary theories such as lean management, six sigma, and reverse logistics coupled with innovations such as artificial intelligence applications, the internet of things, smart products, and procedural engineering are being used to enhance operational effectiveness and will in turn improve a firm\'s performance and competitive position in the market.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"It can help in machine learning projects since you can write blocks that can take time, for example, training the model and running it once then you can run any other faster block without the need to wait for the time-consuming block of code.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nDeep learning \nDeep learning is a term that engineers use when they want to refer to a Neural Network which they are the core of Deep learning and they are powerful and scalable making them ready to overcome complex machine learning projects such as classifying and processing billion of colorful images, recommend millions of users to buy or to watch something, or even learning a board game and beating it (G\u00e9ron 2019).","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Many applications in this field have already been implemented such as Machine translation, Chatbots, and Sentiment analysis, a science that can help analyze if the text is negative or positive which can be used to categorize reviews of users about the products they buy.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\n\n\nResearch Methodology\nStudy Design:\nThe statistical data analysis was performed using the Statistical Package for Social Sciences (SPSS 22) to examine the level and variances of AI integration in each of the five prevalent industries in the study.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"This was quantified by choosing industries and businesses that represent the highest contribution of GDP in the UAE which are in order of contribution the following: wholesale\/retail, financial services and insurance, logistics, manufacturing, and real estate (Al-Dajani 2022).","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nInstrumentation:\nThe data collection process entailed a survey that measured the twenty-four points relating to the six five core functionalities shown below:\nPerformance management (PM): decision automation, objectives management, key actions, and management transparency.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nStrategy development (SD): vision and mission improvement, agility planning, strategic planning, and strategic implementation\nOrganizational Planning (OP): structure and design, roles of management, responsibilities allocation, and communications management.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nThe Data Gathering Process & Ethical Considerations:\nThe first step of the data gathering process entailed identifying the firms within the selected industries that were using Artificial Intelligence applications in their organizational mandate.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"We can see that artificial intelligence is a mostly used in the manufacturing sector followed by the logistics sector then the wholesale and retail sector, and then the financial insurance sector finally the real estate sector is the least developed in AI integration.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Consequently, further development if this innovative technology which is one of the main drivers of the fourth industrial revolution will not only have a positive impact on the competitive position of firms operating in the UAE, but also applies to firms operating anywhere in the world.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Consequently, another contribution that can be drawn from the analysis and conclusions of this study is facilitating the work of both business academicians and practitioners in gaining a better understanding of the current AI integration in local firms while simultaneously providing insight into how to leverage this innovative technology in the future to increase their efficiency and effectiveness resulting in a more favorable competitive position on a global level.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"\nConclusions:\nIn conclusion, it is evident that Artificial Intelligence is in its infancy in the UAE, and there are abundant opportunities to develop this innovative technology not only in business organizations but also in government institutions.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"},{"match":"","sentence":"Although there are some inherent barriers that may impede this development, this is a topic of high importance because in the contemporary globalized world economy firm success will depend on adopting innovations to retain a competitive edge.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"}]';*/
/*
final String json1 = '[{"match":"n\'t","sentence":"This solution isn\'t the most effective one.","label":"SPOKN1","description":"Using contractions"},{"match":"There are","sentence":"There are three ways to solve this problem.","label":"SPOKN1","description":"Using forms of there is\/are"},{"match":"There are","sentence":"There are three ways to solve this problem.","label":"SPOKN1","description":"Using forms of there is\/are"},{"match":"good","sentence":"this is good.","label":"VOCAB5","description":"using a forbidden words"},{"match":"bad","sentence":"this is bad.","label":"VOCAB5","description":"using a forbidden words"},{"match":"like","sentence":"The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.","label":"VOCAB5","description":"using a forbidden words"},{"match":"like","sentence":"The probability of generating the next decoder step can be formulated like this:Food is destroyed by rodents like rats, mice, and hamsters.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"VOCAB5","description":"using a forbidden words"},{"match":"huge","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"VOCAB5","description":"using a forbidden words"},{"match":"process","sentence":"The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.","label":"VOCAB5","description":"using a forbidden words"},{"match":"utilize","sentence":"OR-Tools model utilize only the CPU","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"VOCAB5","description":"using a forbidden words"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"VOCAB5","description":"using a forbidden words"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"VOCAB5","description":"using a forbidden words"},{"match":"necessary","sentence":"The necessary data are difficult to obtain.","label":"VOCAB5","description":"using a forbidden words"},{"match":"huge","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"VOCAB5","description":"using a forbidden words"},{"match":"very","sentence":"React is a very lightweight library.","label":"VOCAB5","description":"using a forbidden words"},{"match":"bad","sentence":"The device performance is bad.","label":"VOCAB5","description":"using a forbidden words"},{"match":"good","sentence":"This design is good.","label":"VOCAB5","description":"using a forbidden words"},{"match":"Also","sentence":"Also, React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, etc.","label":"VOCAB5","description":"using a forbidden words"},{"match":"and so on","sentence":"React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.","label":"SPOKN1","description":"Preferring and so on to etc."},{"match":"and so on","sentence":"React Native provides complete access to the device hardware, such as the camera, file system, Bluetooth, and so on.","label":"SPOKN1","description":"Preferring and so on to etc."},{"match":"for model","sentence":"The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.","label":"WORDNES3","description":"Describing purpose through the use of for + noun or for + gerund"},{"match":"In order to","sentence":"In order to protect the system, a developer must provide a different solution.","label":"WORDNES3","description":"Using in order to"},{"match":"a number of","sentence":"This problem has a number of solutions.","label":"WORDNES3","description":"Using a number of"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"The process of data generation is explained with the following planIn this section, I explain the software tools, libraries, and frameworks used for model development.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"To reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"To reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"We","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"you","sentence":"We will consider two products about which you can find enough information on the Internet.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"You","sentence":"You should be aware of the drawbacks of the system.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"I","sentence":"As a result, I get a huge amount of unneeded connections that I could not filter out.","label":"PRONOUN4","description":"Using pronoun incorrectly"},{"match":"about 100","sentence":"The student has collected about 100 examples.","label":"DIGIT8","description":"Providing tentative facts and figures"},{"match":"4","sentence":"4 of them work in a company for more than a year.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"4 of","sentence":"4 of them work in a company for more than a year.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3","sentence":"This approach has 3 techniques.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"3 techniques","sentence":"This approach has 3 techniques.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"10","sentence":"This design was 10 times more efficient.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"10 times","sentence":"This design was 10 times more efficient.","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"1","sentence":"The student has collected about [1]","label":"DIGIT8","description":"Using digits for numbers below 11"},{"match":"","sentence":"\nTo reach these goals, I decided to analyze the solutions available on the market to highlight the functionality that I want to see in my product, that functionality that can be adapted to my product, and functionality that looks ineffective and it is worth coming up with another solution.","label":"WORDNES3","description":"A very long sentence having over 2 clauses and being over 3 lines long"}]';

List<String> mock = [json1,json2,json3];
*/