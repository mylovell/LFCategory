Pod::Spec.new do |s|

    #项目名称
    s.name         = "LFCategory"

    #版本
    s.version      = "1.0"

    #简介
    s.summary      = "some category."

    #详细描述
    s.description  = "some category usually use."

    #框架首页
    s.homepage     = "https://github.com/mylovell/LFCategory"

    #许可证
    s.license      = "MIT"

    #作者
    s.author             = { "mylovell" => "906197961@qq.com" }

    #设备
    s.platform     = :ios, "8.0"

    #源码地址，还有这里的tag要和上面的s.versio保持一致
    s.source       = { :git => "https://github.com/mylovell/LFCategory.git", :tag => s.version }

    #源码中指定哪些文件需要下载
    s.source_files  = "Classes", "LFCategory/LFCategory/*.{h,m}"

    #s.exclude_files当前用不了，可以不要
    # s.exclude_files = "Classes/Exclude"

end
