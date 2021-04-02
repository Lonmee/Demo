import UIKit
 
class ViewController: UIViewController {
     
    // 搜索控制器
    var searchController: UISearchController!
     
    //展示列表
    var tableView: UITableView!
     
    //原始数据集
    let schoolArray = ["清华大学","北京大学","中国人民大学","北京交通大学","北京工业大学",
                       "北京航空航天大学","北京理工大学","北京科技大学","中国政法大学",
                       "中央财经大学","华北电力大学","北京体育大学","上海外国语大学","复旦大学",
                       "华东师范大学","上海大学","河北工业大学"]
     
    //搜索过滤后的结果集
    var searchArray:[String] = [String](){
        didSet  {self.tableView.reloadData()}
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // 初始化搜索控制器
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
//        self.searchController.dimsBackgroundDuringPresentation = false
        // 将搜索控制器集成到导航栏上
        navigationItem.searchController = self.searchController
         
        //创建表视图
        let tableViewFrame = CGRect(x: 0, y: 20, width: self.view.frame.width,
                                    height: self.view.frame.height-20)
        self.tableView = UITableView(frame: tableViewFrame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "MyCell")
        self.view.addSubview(self.tableView!)
    }
}
 
extension ViewController: UISearchResultsUpdating {
    //实时进行搜索
    func updateSearchResults(for searchController: UISearchController) {
        self.searchArray = self.schoolArray.filter { (school) -> Bool in
            return school.contains(searchController.searchBar.text!)
        }
    }
}
 
extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.isActive {
            return self.searchArray.count
        } else {
            return self.schoolArray.count
        }
    }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "MyCell"
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                     for: indexPath)
            if self.searchController.isActive {
                cell.textLabel?.text = self.searchArray[indexPath.row]
                return cell
            } else {
                cell.textLabel?.text = self.schoolArray[indexPath.row]
                return cell
            }
    }
}
