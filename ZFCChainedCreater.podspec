


Pod::Spec.new do |s|
s.name = 'ZFCChainedCreater'
s.version = '1.0.1'
s.license = { :type => "MIT", :file => "LICENSE" }
s.summary = '这是一个将UI的创建转成链式调用，包含UIView、UILabel、UIImageView、UIButton、UITextField、UITextView、UITableView、UICollectionView这些常用控件的创建；还可以将tableView、collectionView的使用转成链式调用，不用再每次写复杂的代理；而且还支持复杂tableView的抽离，使用起来不仅方便简洁，代码可维护性大大提高。'


s.homepage = 'https://github.com/zfc769956454/ZFCChainedCreater'
s.authors = { 'zhaofuheng' => '769956454@qq.com' }
s.source = { :git => 'https://github.com/zfc769956454/ZFCChainedCreater.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '8.0'
s.source_files = 'ZFCChainedCreater/*.{h,m}'


end
