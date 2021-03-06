moment = require('moment')
docpadConfig = {
  templateData:
    site:
      title: 'Tank Studios'
      tagline: 'Following Jesus in a Modern World'
      description: 'Blogging about my walk with Jesus in a modern world'
      logo: '/img/logo.ico'
      url: 'http://blog.tankstudios.net/'
      # url: 'http://localhost:9778/'
      cover: '/img/cover.jpg'
      navigation: [
        {
          name: 'Home',
          href: '/',
          section: 'home'
        },
        {
          name: 'About',
          href: '/about.html',
          section: 'about'
        },
        {
          name: 'Contact',
          href: '/contact.html',
          section: 'contact'
        },
        {
          name: 'Life',
          href: '/tags/life.html',
          section: 'tag-life'
        },
        {
          name: 'Tech',
          href: '/tags/tech.html',
          section: 'tag-tech'
        },
        {
          name: 'Story',
          href: '/tags/story.html',
          section: 'tag-story'
        }
        # {
        #   name: 'Dev',
        #   href: '/tags/Dev.html',
        #   section: 'tag-Dev'
        # }
      ]
    authors: [
        {
          name: 'Ryan Tankersley'
          image: '/img/ryan.png'
          url: ''
          location: 'Tulsa, OK',
          bio: ''
        },
        {
          name: 'Michelle Tankersley'
          image: '/img/michelle.png'
          url: ''
          location: 'Tulsa, OK',
          bio: ''
        }
      ]
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getDescription: -> if @document.description then "#{@document.description} | #{@site.description}" else @site.description
    bodyClass: -> if @document.isPost then "post-template" else "home-template"
    masthead: (d) ->
      d = d || @document
      if d.cover then d.cover else @site.cover
    isCurrent: (l) ->
      if @document.section is l.section  then ' nav-current'
      else if @document.url is l.href then ' nav-current'
      else ''
    excerpt: (p,w) ->
      w = w || 26
      if p.excerpt then p.excerpt else p.content.replace(/<%.+%>/gi, '').split(' ').slice(0, w).join(' ')
    encode: (s) -> encodeURIComponent(s)
    slug: (s) -> return s.toLowerCase().replace(' ', '-')
    currentYear: -> new Date().getFullYear()
    time: (ts, format) ->
      format = format || 'MMMM DO, YYYY'
      ts = new Date(ts) || new Date()
      moment(ts).format(format)
  collections:
    posts: ->
      @getCollection("html").findAllLive({active:true, isPost: true, isPagedAuto: {$ne: true}}, {postDate: -1}).on "add", (model) ->
        model.setMetaDefaults({layout:"post"})
  plugins:
    tags:
      extension: '.html'
      injectDocumentHelper: (doc) ->
        doc.setMeta { layout: 'tag' }
    rss:
      default:
        collection: 'posts'
        url: '/rss.xml'
}

module.exports = docpadConfig