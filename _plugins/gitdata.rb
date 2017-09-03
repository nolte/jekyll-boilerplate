module Jekyll

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      print 'Current Branch: '

      ignorePaths = ['assets']

      if ENV['JEKYLL_GIT_BRANCH']
        value = ENV['JEKYLL_GIT_BRANCH']
      else
        value = `git rev-parse --abbrev-ref HEAD`
        value = value.strip!
      end
      print value
      currentFolder = `echo $(pwd)`
      print currentFolder
      print `git rev-parse --abbrev-ref HEAD`
      print `git config --list`
      print `git --version`
      site.config['branche'] = value

      site.pages.each do | page |
        #print page.path
        addGitHashTag = true
        ignorePaths.each do | ignorepath |
          if page.path.include? ignorepath
              addGitHashTag = false
          end
        end

        if addGitHashTag
          cmd = 'git log --pretty=oneline --abbrev-commit --pretty=format:"%H" -1 ' + page.path
          file =  `#{cmd}`
          page.data['hash'] = file
        end

      end

      site.documents.each do | document |
        cmd = 'git log --pretty=oneline --abbrev-commit --pretty=format:"%H" -1 ' + document.path
        file =  `#{cmd}`
        document.data['hash'] = file
      end
    end
  end

end
