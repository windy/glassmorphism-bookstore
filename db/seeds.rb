# 创建管理员（如果不存在）
admin = Administrator.find_or_create_by(name: 'admin') do |admin|
  admin.role = 'super_admin'
  admin.password = 'admin'
  admin.password_confirmation = 'admin'
end

puts "管理员创建成功: #{admin.name}"

# 创建测试书籍
books_data = [
  {
    title: "人工智能简史",
    author: "尼克·博斯特罗姆",
    description: "深入浅出地介绍人工智能的发展历程，从图灵测试到深度学习，从机器学习到神经网络。本书为读者呈现了一个完整的人工智能发展脉络，是了解AI技术不可多得的入门读物。",
    price: 68.00,
    isbn: "978-7-111-12345-1",
    category: "科技",
    published_at: Date.current - 1.year,
    stock_quantity: 50
  },
  {
    title: "百年孤独",
    author: "加西亚·马尔克斯",
    description: "魔幻现实主义的经典之作，讲述了布恩迪亚家族七代人的传奇故事。作品融现实与虚幻于一体，展现了一个瑰丽的想象世界，映射了拉丁美洲的历史演变和社会现实。",
    price: 45.00,
    isbn: "978-7-111-12345-2", 
    category: "文学",
    published_at: Date.current - 2.years,
    stock_quantity: 30
  },
  {
    title: "聪明的投资者",
    author: "本杰明·格雷厄姆",
    description: "价值投资理论奠基之作，被誉为'投资界的圣经'。本书阐述了价值投资的核心理念，教会读者如何在股市中做出理性的投资决策，是每个投资者必读的经典。",
    price: 52.00,
    isbn: "978-7-111-12345-3",
    category: "投资理财",
    published_at: Date.current - 3.months,
    stock_quantity: 25
  },
  {
    title: "心理学与生活",
    author: "理查德·格里格",
    description: "心理学入门的权威教材，以生动有趣的方式介绍心理学的基本概念和原理。本书将抽象的心理学理论与日常生活实例相结合，帮助读者更好地理解人类行为和心理现象。",
    price: 89.00,
    isbn: "978-7-111-12345-4",
    category: "心理学",
    published_at: Date.current - 6.months,
    stock_quantity: 40
  },
  {
    title: "设计心理学",
    author: "唐纳德·诺曼",
    description: "用户体验设计的经典著作，探讨了人与产品交互的心理机制。作者通过大量实例分析了好设计与坏设计的区别，为产品设计师和用户体验从业者提供了宝贵的指导。",
    price: 56.00,
    isbn: "978-7-111-12345-5",
    category: "设计",
    published_at: Date.current - 8.months,
    stock_quantity: 35
  },
  {
    title: "编程珠玑",
    author: "乔恩·本特利",
    description: "程序员必读的经典之作，通过一系列有趣的编程问题，展示了程序设计的精髓和算法思维。本书不仅提供了解决问题的方法，更重要的是培养了读者的编程思维和解决问题的能力。",
    price: 72.00,
    isbn: "978-7-111-12345-6",
    category: "编程",
    published_at: Date.current - 1.month,
    stock_quantity: 60
  },
  {
    title: "三体",
    author: "刘慈欣",
    description: "中国科幻小说的里程碑作品，获得雨果奖的优秀科幻小说。小说以宏大的想象力描绘了人类文明与外星文明的第一次接触，思考了文明、科技、人性等深刻主题。",
    price: 38.00,
    isbn: "978-7-111-12345-7",
    category: "科幻",
    published_at: Date.current - 2.years,
    stock_quantity: 80
  },
  {
    title: "史记",
    author: "司马迁",
    description: "中国第一部纪传体通史，记录了从传说中的黄帝到汉武帝太初四年约3000年的历史。本书开创了纪传体史书的先河，被誉为'史家之绝唱，无韵之离骚'。",
    price: 120.00,
    isbn: "978-7-111-12345-8",
    category: "历史",
    published_at: Date.current - 5.years,
    stock_quantity: 20
  },
  {
    title: "原则",
    author: "瑞·达利欧",
    description: "桥水基金创始人的人生和工作原则分享。作者通过自己的人生经历和投资实践，总结出一套系统的原则体系，帮助读者在生活和工作中做出更好的决策。",
    price: 68.00,
    isbn: "978-7-111-12345-9",
    category: "自我提升",
    published_at: Date.current - 4.months,
    stock_quantity: 45
  },
  {
    title: "深度学习",
    author: "伊恩·古德费洛",
    description: "深度学习领域的权威教材，由深度学习领域的顶尖专家撰写。本书全面介绍了深度学习的理论基础、算法实现和应用实例，是学习深度学习不可或缺的参考书。",
    price: 158.00,
    isbn: "978-7-111-12346-0",
    category: "人工智能",
    published_at: Date.current - 7.months,
    stock_quantity: 30
  }
]

books_data.each do |book_data|
  book = Book.find_or_create_by(isbn: book_data[:isbn]) do |b|
    b.assign_attributes(book_data)
  end
  puts "书籍创建成功: #{book.title}"
end

puts "数据创建完成！共创建了 #{Book.count} 本书籍"