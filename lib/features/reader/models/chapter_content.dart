// lib/features/reader/models/chapter_content.dart

class ChapterContent {
  final String id;
  final String title;
  final List<String> pages;

  const ChapterContent({
    required this.id,
    required this.title,
    required this.pages,
  });
}

// Sample chapter content
final chapterOneContent = ChapterContent(
  id: 'chapter-1',
  title: 'Chapter One',
  pages: [
    // Page 1
    '''The infection comes as fever at night. If you take ill, watch the veins—the tributary of blood travelling down the arms. If they remain as they ever did, you have nothing to fear.

If the blood darkens to an inky black, the infection has taken hold.

The infection comes as fever at night.

I was nine the first time the Physicians came to our house. My uncle and his men were away. My cousin Ione and her brothers played loudly in the kitchen, and my aunt did not hear the pounding at the door until the first man in white robes was already in the parlor. She did not have time to hide me. I was asleep, resting like a cat in the window.''',

    // Page 2
    '''When she shook me awake, her voice was thick with fear. "Go to the wood," she whispered, unlatching the window and gently pushing me through the casement to the ground below.

The night was cold, and I wore only my nightgown. The grass was wet beneath my feet as I ran, branches whipping past my face as I plunged deeper into the forest. Behind me, I could hear the shouts of men and the thundering of boots on wooden floors.

I ran until my lungs burned and my legs trembled. Only then did I dare to stop, pressing myself against the rough bark of an ancient oak. The forest was silent now, save for the rapid beating of my heart and the soft whisper of leaves in the wind.''',

    // Page 3
    '''Hours passed, or perhaps it was minutes—time moves strangely when you're afraid. When I finally crept back to the house, dawn was breaking over the horizon, painting the sky in shades of pink and gold. The Physicians were gone, but they had left their mark: overturned furniture, scattered papers, and my aunt's tears.

That was the night I learned about the Nightmare. Not the ordinary kind that haunts children's dreams, but the ancient spirit that would become both my curse and my salvation. The spirit that now whispers to me, even as I write these words.

"They will come again," my aunt said, holding me close. "And next time, we must be ready."

She was right about one thing: they did come again. But no one could have been ready for what followed.'''
  ],
);
