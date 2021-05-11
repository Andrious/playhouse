// Copyright 2021 Grey & Ivy Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:playhouse/src/model.dart';

Future<void> loadScrapBookDatabase(Database db) async {

  final timeStamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Module 0',
       'Storytelling and 4 Pillars',
       '',
       'Design')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 0.1.1',
       'Task 0.1.1',
       'Families/groups should make up a totally new story where each person adds a word until you reach 30 words. Each time someone has to add a word, they need to frame it under the umbrella of either ‘Environmental, Economic, Cultural, Social’ depending on which one they are on. Afterwards, they reorganize the story in one minute for it to make the most sense.')
       ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 0.1.2',
       'Task 0.1.2',
       'A picture is worth a 1000 words is often what we’re told. Well in this case, we’re going to say 250 words. Using either images provided by us or self-provided images, or perhaps they can snap a photo through the app and upload it. Each user will then imagine and create a fictional story based on that single image.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Module 1',
       'Creativity Stimulation',
       '',
       'Design')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Sub-module 1.1',
       'Feeling of things',
       'Through this sub-module users dig into how their outer environment affects their inner feelings.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.1.1',
       'Gaming Phase',
       'We can include some multiple answer questions showing some objects/images/ places/ describing some experiences, etc., and ask the users to match them with different feelings. The intent is that the users exercise how to link their feelings into objects.
There are many scientifically proven Social Emotional Learning Games. We can include one of the existing games in our app (with reference). We should also look for an environmental one or develop one if the game is not available. One keyword could be emotional architecture, emotional design, emotional impact of architecture
')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.1.2',
       'Upload Three Images',
       'Users should upload images of three places/ objects that reflect three emotions that randomly would be given by the app (similar ‘digital cards’).. They might do internet research, refer to their old pics or even take new photos. They should upload the photos into their profile album, describe the reasons that they link these images with that emotions (texture, color, material, design, memory, etc.) and share that with other users/ app instructors to be judged. Based on the other users’ rank to each photo, we can save the images in the app images pool to be used for task 1.1.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Sub-module 1.2',
       'Crafting an Experience',
       "Through this sub-module users consciously see how their six senses (vision, hearing, touch, taste, smell, and Proprioception: the body's ability to perceive its own position in space) build their experience of the environment around them. They also pay attention to the role of environments in their memories.")
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.2.1',
       'In a dark room with a paper and pen',
       'The user should sit in a dark room with a paper and pen in hand. The app randomly gives the user 5 images from a simple shape image to a more complicated image. The user should draw what he sees without taking a look at the paper in a predefined time. Then scan and upload what he drew to get the score. The intent is that the user should exercise to look at objects carefully and to adopt his eyes, with his mind and hand.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.2.2',
       'Listen To Your Music',
       'The user should listen to her favorite music with closed eyes and paper and pen in hand. Select 10 seconds of the music which impresses her the most, while listening to that 10 seconds, let her hand to draw what she hears and feels freely. The result might be something similar to Audio visualizer.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.2.3',
       'About Five Feelings',
       'Users should write about their feelings about five materials that they touch by their hands and feet at their home.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.2.4',
       'Upload Your Perception',
       'Users should upload some images that reflect their perception of the spaces through each of their six senses. They should also tell the story behind each. Other users/ app instructors score the images/ stories.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Sub-module 1.3',
       'Design Principles and Elements',
       'The elements, or principles, of visual design include Contrast, Balance, Emphasis, Movement, White Space, Proportion, Hierarchy, Repetition, Rhythm, Pattern, Unity, and Variety. Through this sub-module, the users learn about the importance of theses principles and elements in their environmental perception.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.3.1',
       'matching game',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.3.2',
       'take three photos',
       'Users should take three photos of spaces that lines emphasize on three of design principals given by the app. We can include other tasks for shapes, colors, forms, textures, light and shadow, pattern, etc. As I mentioned we can also add some psychological tests here.
I have many ideas about tasks of this submodule that are really exciting. I will refer to my teaching documents and provide you with details. I will also include some personality type tests related to the colors, forms, shapes, music, etc.
')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Module 2',
       'Identity',
       '',
       'Design')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Submodule/Floater 2.1',
       'Family Connection',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 2.1.1',
       'Those Closest To You',
       'For this task, please list and describe your closest family members or anyone that you feel is (or was) closest to you. Please include a fun sketch of them, their name, their relationship to you, and what traits/qualities you think best describes them.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 2.1.2',
       'Your Family History',
       'For this task, you will now dive a bit deeper into your family history and coordinate a fun interview with each family member or person you included in your previous list. Please ask three questions about their personal history. These questions can be whatever you want and can change from person to person. An example question can be, what was your favorite place to visit as a child? Please use either text to document their answers and submit them into the app.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 2.1.3',
       'Assemble Your Team',
       'For this task, you will now look at everyone you interviewed and/or listed and begin to assemble a team that would help you with the construction and maintenance of your design-build structure. You will assign everyone you chose a specific role and describe what that role does and why you chose that person. For example, you can have a family member be an electrician or landscaper for your project because they are great at working with their hands and love fixing things. Please provide their name, their role, what that role does, why you chose them, and lastly provide a fun sketch of them in their role.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Submodule/Floater 2.2',
       'Cultural Connection',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 2.2.1',
       'Your Background',
       'For this task, please provide a brief description of your families cultural background. There are many different cultures found throughout the world and that is what makes it so wonderful. For your description, please include where your family is from, what their culture means to them, and what their relationship with our planet means to their culture. If you are unable to provide your families cultural background, please research and provide a very brief description about a local culture within your current area/region. Please feel free to use text, sketches and/or images.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task. 2.2.2',
       'Explore Your Family',
       ' For this task, please begin to explore the unique characteristics that define your families culture. These characteristics can include language, cuisine, music, arts, clothing, architecture, etc. Begin to ask your family what defines their culture and share what you discover using text, sketches, and/or other images. If you researched a local culture, please continue with your selection and provide more insight into the unique characteristics and qualities that encompass your selection.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task.2.2.3',
       'One Unique Quality',
       'For this task, you will choose one unique characteristic or quality about your families cultural background and attempt to participate or re-create that characteristic. For example, you can choose to cook a certain dish, or you can learn a piece of music, or you can simply take a photo of a significant structure unique to your families culture. All these unique characteristics are celebrations of culture. If you researched a local culture, please attempt to participate or re-create one unique characteristic of that culture. Please document using text, sketches, photos and/or video and explain what you learned from this process.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       '',
       '',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Submodule/Floater 2.3',
       'Self-Reflection',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 2.3.1',
       'Who are you?',
       'For this task, please provide a brief description of who you are as an individual. Please feel free to include whatever you desire which can involve where you are from, interests and hobbies, as well as what goals you wish to achieve right now or in the future. Please use text, sketches or photos to tell your story.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 2.3.2',
       'Five Images of You',
       'For this task, please explore and select five specific images that you think best describes who you are. These images can be photos and/or sketches. Please use whatever sources available to you to collect your images. For example, if you love nature, you can use an image of a tree or your favorite nature scene. If you love a certain food or dish, use an image of that favorite food. This collection of images is not meant to be organized in any order.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Module 3',
       'Memory',
       '',
       'Design')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 3.1.1',
       'Remember a memory',
       'Please choose to either describe your earliest memory or your most favorite memory growing up. Use a combination of text, images and/or sketches to explain and share your chosen memory')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 3.1.2',
       'Create a Timeline',
       'Create a timeline of your life from when you were born up until the present moment. Please highlight on your timeline a minimum of eight specific dates and/or memories/moments in your life that meant a lot to you.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       '',
       '',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Submodule/Floater 3.2',
       'Nostalgia',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 3.2.1',
       'Your Favorite Place',
       'Please select one space or place that you can remember as a child that was your absolute most favorite place to spend time. Provide a detailed description of a certain memory you had there and please include an image or sketch of the space/place, the name, the location, and the date.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 3.2.2',
       'Your Fantasy Place',
       'For this task, you will now select a fictional space or place that is currently your favorite or one that you can remember as a child that you wished could have visited or spent time in in real life. Please provide a simple description of that certain fictional space/place as well as any certain memory connected with it. Please also include an image or sketch of the fictional space/place, its name and where it is found, and why you loved it as a child.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       '',
       '',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Module 0',
       'Spirit of Place',
       '',
       'Design')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Sub Module 0.1',
       'Build Your Design Kit',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 0.1.1',
       'Grey & Ivy Student Design Kit',
       '.7 Stadtler pencil (light blue)
Black Sharpie
A metric and imperial scale
Industrial DeWalt Measuring tape w/ both Metric and Imperial
The Student booklet.
Grey & Ivy hat and t-shirt
Grey & Ivy sun dial?
A Level
')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Sub Module 0.2',
       'Cultural History of Place',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 0.2.1',
       ' Understanding the Culture',
       'Understanding the culture of a place is critical to truly understanding any site, region, or area. For this task, please provide an example or more of the local cultures found within your region/area and briefly describe which culture they originate from. These examples can include languages, architecture, music, food, etc. It’s vital that we not only acknowledge the cultural history of an area, but also take the time to learn more about it and discover the unique qualities found within.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.MODULES} (
       name,
       short_description,
       long_description,
       module_type) VALUES (
       'Module 1',
       'Sun and Shadow Assessment',
       '',
       'Design')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.SUBMODULES} (
       module_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Sub Module 1.1',
       'Sun Exposure',
       '')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.1.1',
       'Choose Your Site',
       'Choose a site within your yard, local neighborhood or area. Walk to your site three times a day. Once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Document what you see and feel during each visit using text, sketching, photography, and/or video. Are there lots of people or animals? Are there trees or no trees? Is it cold or warm?')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.1.2',
       'See Your Site',
       'Choose a site within your local neighborhood or area. On a sunny day, walk to your site once in the morning, once in the afternoon, and once in the evening. Spend 10-15 minutes during each visit. Describe how the sunshine changes and impacts your site based on each visit. On a cloudy day, please do the exact same thing and describe any differences you notice between the sunny and cloudy days during each visit. Use either text, sketch, photography, and/or video.')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.TASKS} (
       submodule_id,
       name,
       short_description,
       long_description) VALUES (
       0,
       'Task 1.1.3',
       'Your Location Over Time',
       'Over a 3-hour time span during the day, go outside and while in the same position, locate the sun in the sky. Document its location either through photography, video, or sketch. Label the time of day and repeat every 30 minutes for 3-Hours. Summarize what you noticed about the suns positioning throughout the time span. Were you able to see it at all times or was it hidden?')
    ''');

  await db.execute('''
       INSERT INTO ${PlayhouseSQLiteDB.ORGANIZATIONS} (
       name,
       short_description,
       long_description,
       time_stamp) VALUES ('General Public',
       'Default Organization',
       'Default Organization if not associated to a particular company or organization.',
       $timeStamp)
    ''');
}
