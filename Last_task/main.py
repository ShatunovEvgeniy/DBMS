import log_filter
import users_filter

if __name__ == "__main__":
    log_filter.log_filter('log(1).csv', 'utf-8')
    users_filter.users_filter('users(1).csv', 'koi8_r')
