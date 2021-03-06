workers=3 # 并行工作进程数   
threads = 2 # 指定每个工作者的线程数   
bind=['web:9001'] # 监听内网端口8000   
proc_name='spug_api' # 进程名称   
pidfile='/tmp/spug_api.pid' # 设置进程文件目录   
worker_class='gevent' # 工作模式协程   
timeout=30 # 超时   
max_requests=6000 # 最大请求数   
