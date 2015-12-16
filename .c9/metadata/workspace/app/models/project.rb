{"filter":false,"title":"project.rb","tooltip":"/app/models/project.rb","undoManager":{"mark":100,"position":100,"stack":[[{"start":{"row":1,"column":15},"end":{"row":1,"column":16},"action":"remove","lines":["u"],"id":8}],[{"start":{"row":1,"column":15},"end":{"row":1,"column":16},"action":"insert","lines":["o"],"id":9}],[{"start":{"row":1,"column":16},"end":{"row":1,"column":17},"action":"insert","lines":["p"],"id":10}],[{"start":{"row":1,"column":17},"end":{"row":1,"column":18},"action":"insert","lines":["n"],"id":11}],[{"start":{"row":1,"column":18},"end":{"row":1,"column":19},"action":"insert","lines":["e"],"id":12}],[{"start":{"row":1,"column":18},"end":{"row":1,"column":19},"action":"remove","lines":["e"],"id":13}],[{"start":{"row":1,"column":17},"end":{"row":1,"column":18},"action":"remove","lines":["n"],"id":14}],[{"start":{"row":1,"column":17},"end":{"row":1,"column":18},"action":"insert","lines":["e"],"id":15}],[{"start":{"row":1,"column":18},"end":{"row":1,"column":19},"action":"insert","lines":["n"],"id":16}],[{"start":{"row":1,"column":24},"end":{"row":1,"column":25},"action":"remove","lines":["p"],"id":17}],[{"start":{"row":1,"column":23},"end":{"row":1,"column":24},"action":"remove","lines":["i"],"id":18}],[{"start":{"row":1,"column":22},"end":{"row":1,"column":23},"action":"remove","lines":["v"],"id":19}],[{"start":{"row":1,"column":22},"end":{"row":1,"column":23},"action":"insert","lines":["c"],"id":20}],[{"start":{"row":1,"column":23},"end":{"row":1,"column":24},"action":"insert","lines":["l"],"id":21}],[{"start":{"row":1,"column":24},"end":{"row":1,"column":25},"action":"insert","lines":["o"],"id":22}],[{"start":{"row":1,"column":25},"end":{"row":1,"column":26},"action":"insert","lines":["s"],"id":23}],[{"start":{"row":1,"column":26},"end":{"row":1,"column":27},"action":"insert","lines":["e"],"id":24}],[{"start":{"row":1,"column":27},"end":{"row":1,"column":56},"action":"remove","lines":[", :admin, :finance, :investor"],"id":25}],[{"start":{"row":1,"column":28},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":26},{"start":{"row":2,"column":0},"end":{"row":2,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":2,"column":2},"end":{"row":6,"column":5},"action":"insert","lines":["  after_initialize :set_default_role, :if => :new_record?","","  def set_default_role","    self.role ||= :user","  end"],"id":27}],[{"start":{"row":7,"column":0},"end":{"row":8,"column":17},"action":"remove","lines":["  belongs_to :entrepreneur","  has_many :deals"],"id":28}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":29}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":17},"action":"insert","lines":["  belongs_to :entrepreneur","  has_many :deals"],"id":30}],[{"start":{"row":2,"column":17},"end":{"row":3,"column":0},"action":"insert","lines":["",""],"id":31},{"start":{"row":3,"column":0},"end":{"row":3,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":5,"column":2},"end":{"row":5,"column":4},"action":"remove","lines":["  "],"id":32}],[{"start":{"row":4,"column":10},"end":{"row":4,"column":11},"action":"remove","lines":["e"],"id":33}],[{"start":{"row":4,"column":9},"end":{"row":4,"column":10},"action":"remove","lines":["l"],"id":34}],[{"start":{"row":4,"column":8},"end":{"row":4,"column":9},"action":"remove","lines":["o"],"id":35}],[{"start":{"row":4,"column":7},"end":{"row":4,"column":8},"action":"remove","lines":["r"],"id":36}],[{"start":{"row":4,"column":7},"end":{"row":4,"column":8},"action":"insert","lines":["s"],"id":37}],[{"start":{"row":4,"column":8},"end":{"row":4,"column":9},"action":"insert","lines":["t"],"id":38}],[{"start":{"row":4,"column":9},"end":{"row":4,"column":10},"action":"insert","lines":["a"],"id":39}],[{"start":{"row":4,"column":7},"end":{"row":4,"column":10},"action":"remove","lines":["sta"],"id":40},{"start":{"row":4,"column":7},"end":{"row":4,"column":13},"action":"insert","lines":["status"]}],[{"start":{"row":5,"column":35},"end":{"row":5,"column":36},"action":"remove","lines":["e"],"id":41}],[{"start":{"row":5,"column":34},"end":{"row":5,"column":35},"action":"remove","lines":["l"],"id":42}],[{"start":{"row":5,"column":33},"end":{"row":5,"column":34},"action":"remove","lines":["o"],"id":43}],[{"start":{"row":5,"column":32},"end":{"row":5,"column":33},"action":"remove","lines":["r"],"id":44}],[{"start":{"row":5,"column":32},"end":{"row":5,"column":33},"action":"insert","lines":["s"],"id":45}],[{"start":{"row":5,"column":33},"end":{"row":5,"column":34},"action":"insert","lines":["t"],"id":46}],[{"start":{"row":5,"column":34},"end":{"row":5,"column":35},"action":"insert","lines":["a"],"id":47}],[{"start":{"row":5,"column":35},"end":{"row":5,"column":36},"action":"insert","lines":["t"],"id":48}],[{"start":{"row":5,"column":36},"end":{"row":5,"column":37},"action":"insert","lines":["u"],"id":49}],[{"start":{"row":5,"column":37},"end":{"row":5,"column":38},"action":"insert","lines":["s"],"id":50}],[{"start":{"row":7,"column":21},"end":{"row":7,"column":22},"action":"remove","lines":["e"],"id":51}],[{"start":{"row":7,"column":20},"end":{"row":7,"column":21},"action":"remove","lines":["l"],"id":52}],[{"start":{"row":7,"column":19},"end":{"row":7,"column":20},"action":"remove","lines":["o"],"id":53}],[{"start":{"row":7,"column":18},"end":{"row":7,"column":19},"action":"remove","lines":["r"],"id":54}],[{"start":{"row":7,"column":18},"end":{"row":7,"column":19},"action":"insert","lines":["s"],"id":55}],[{"start":{"row":7,"column":19},"end":{"row":7,"column":20},"action":"insert","lines":["t"],"id":56}],[{"start":{"row":7,"column":20},"end":{"row":7,"column":21},"action":"insert","lines":["a"],"id":57}],[{"start":{"row":7,"column":21},"end":{"row":7,"column":22},"action":"insert","lines":["t"],"id":58}],[{"start":{"row":7,"column":22},"end":{"row":7,"column":23},"action":"insert","lines":["u"],"id":59}],[{"start":{"row":7,"column":23},"end":{"row":7,"column":24},"action":"insert","lines":["s"],"id":60}],[{"start":{"row":8,"column":12},"end":{"row":8,"column":13},"action":"remove","lines":["e"],"id":61}],[{"start":{"row":8,"column":11},"end":{"row":8,"column":12},"action":"remove","lines":["l"],"id":62}],[{"start":{"row":8,"column":10},"end":{"row":8,"column":11},"action":"remove","lines":["o"],"id":63}],[{"start":{"row":8,"column":9},"end":{"row":8,"column":10},"action":"remove","lines":["r"],"id":64}],[{"start":{"row":8,"column":9},"end":{"row":8,"column":10},"action":"insert","lines":["s"],"id":65}],[{"start":{"row":8,"column":10},"end":{"row":8,"column":11},"action":"insert","lines":["t"],"id":66}],[{"start":{"row":8,"column":11},"end":{"row":8,"column":12},"action":"insert","lines":["a"],"id":67}],[{"start":{"row":8,"column":12},"end":{"row":8,"column":13},"action":"insert","lines":["t"],"id":68}],[{"start":{"row":8,"column":13},"end":{"row":8,"column":14},"action":"insert","lines":["u"],"id":69}],[{"start":{"row":8,"column":14},"end":{"row":8,"column":15},"action":"insert","lines":["s"],"id":70}],[{"start":{"row":8,"column":24},"end":{"row":8,"column":25},"action":"remove","lines":["r"],"id":71}],[{"start":{"row":8,"column":23},"end":{"row":8,"column":24},"action":"remove","lines":["e"],"id":72}],[{"start":{"row":8,"column":22},"end":{"row":8,"column":23},"action":"remove","lines":["s"],"id":73}],[{"start":{"row":8,"column":21},"end":{"row":8,"column":22},"action":"remove","lines":["u"],"id":74}],[{"start":{"row":8,"column":21},"end":{"row":8,"column":22},"action":"insert","lines":["o"],"id":75}],[{"start":{"row":8,"column":22},"end":{"row":8,"column":23},"action":"insert","lines":["p"],"id":76}],[{"start":{"row":8,"column":23},"end":{"row":8,"column":24},"action":"insert","lines":["e"],"id":77}],[{"start":{"row":8,"column":24},"end":{"row":8,"column":25},"action":"insert","lines":["m"],"id":78}],[{"start":{"row":8,"column":24},"end":{"row":8,"column":25},"action":"remove","lines":["m"],"id":79}],[{"start":{"row":8,"column":24},"end":{"row":8,"column":25},"action":"insert","lines":["n"],"id":80}],[{"start":{"row":4,"column":30},"end":{"row":5,"column":0},"action":"insert","lines":["",""],"id":81},{"start":{"row":5,"column":0},"end":{"row":5,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":5,"column":2},"end":{"row":5,"column":37},"action":"insert","lines":["enum status: [ :active, :archived ]"],"id":82}],[{"start":{"row":4,"column":29},"end":{"row":4,"column":30},"action":"insert","lines":[" "],"id":83}],[{"start":{"row":4,"column":16},"end":{"row":4,"column":17},"action":"insert","lines":[" "],"id":84}],[{"start":{"row":5,"column":0},"end":{"row":6,"column":0},"action":"remove","lines":["  enum status: [ :active, :archived ]",""],"id":85}],[{"start":{"row":0,"column":34},"end":{"row":1,"column":0},"action":"insert","lines":["",""],"id":86},{"start":{"row":1,"column":0},"end":{"row":1,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["  enum status: [ :open, :close ]",""],"id":87}],[{"start":{"row":7,"column":0},"end":{"row":8,"column":0},"action":"remove","lines":["  after_initialize :set_default_status, :if => :new_record?",""],"id":88}],[{"start":{"row":1,"column":32},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":89},{"start":{"row":2,"column":0},"end":{"row":2,"column":2},"action":"insert","lines":["  "]}],[{"start":{"row":2,"column":2},"end":{"row":3,"column":0},"action":"insert","lines":["  after_initialize :set_default_status, :if => :new_record?",""],"id":90}],[{"start":{"row":2,"column":2},"end":{"row":2,"column":4},"action":"remove","lines":["  "],"id":91}],[{"start":{"row":8,"column":0},"end":{"row":10,"column":0},"action":"remove","lines":["  enum status: [ :open, :close ]","",""],"id":92}],[{"start":{"row":3,"column":0},"end":{"row":4,"column":2},"action":"remove","lines":["","  "],"id":93}],[{"start":{"row":1,"column":30},"end":{"row":1,"column":31},"action":"insert","lines":[","],"id":94}],[{"start":{"row":1,"column":31},"end":{"row":1,"column":32},"action":"insert","lines":[" "],"id":95}],[{"start":{"row":1,"column":32},"end":{"row":1,"column":33},"action":"insert","lines":["a"],"id":96}],[{"start":{"row":1,"column":32},"end":{"row":1,"column":33},"action":"remove","lines":["a"],"id":97}],[{"start":{"row":1,"column":32},"end":{"row":1,"column":33},"action":"insert","lines":[":"],"id":98}],[{"start":{"row":1,"column":33},"end":{"row":1,"column":34},"action":"insert","lines":["a"],"id":99}],[{"start":{"row":1,"column":34},"end":{"row":1,"column":35},"action":"insert","lines":["p"],"id":100}],[{"start":{"row":1,"column":35},"end":{"row":1,"column":36},"action":"insert","lines":["p"],"id":101}],[{"start":{"row":1,"column":36},"end":{"row":1,"column":37},"action":"insert","lines":["r"],"id":102}],[{"start":{"row":1,"column":37},"end":{"row":1,"column":38},"action":"insert","lines":["o"],"id":103}],[{"start":{"row":1,"column":38},"end":{"row":1,"column":39},"action":"insert","lines":["v"],"id":104}],[{"start":{"row":1,"column":39},"end":{"row":1,"column":40},"action":"insert","lines":["e"],"id":105}],[{"start":{"row":1,"column":40},"end":{"row":1,"column":41},"action":"insert","lines":["s"],"id":106}],[{"start":{"row":1,"column":40},"end":{"row":1,"column":41},"action":"remove","lines":["s"],"id":107}],[{"start":{"row":1,"column":40},"end":{"row":1,"column":41},"action":"insert","lines":["d"],"id":108}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":3,"column":0},"end":{"row":3,"column":0},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1449399907025,"hash":"300c49221713ff938ae7ba914897756863a20ba2"}