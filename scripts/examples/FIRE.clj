(use 'korma.db)
(use 'korma.core)
(use 'clojure.java.io)
(require '[clj-http.client :as client])
(require '[net.cgrand.enlive-html :as html])
(require '[monger.core :as mg])
(require '[monger.collection :as mc])
(require '[clojure-csv.core :as csv])
(require '[clojure.java.shell :as shell])

(def chatwork-api-key "c85d83787deb38f99fe3b07276b8d4a6")
(def room-id "32341090")
(def chatwork-url (str "https://api.chatwork.com/v1/rooms/" room-id "/messages"))

(def nippo-content
  "【本日のタスク目標】
【本日のタスク目標】
コードレビュー
ヒカカクのブログ移行

【本日のタスク成果】
コードレビュー
→ OK
ヒカカクのブログ移行
→ mapsとco_cats、categoriesを移行してました。まだ完成できておらず(bow)

【残タスク】
ヒカカクブログRails化
もやしRails化
もやしのブログ移行
(companyページ)


【今日の気付き・連絡事項・相談事項・提案事項】
次は明日です。


【今日の小ネタ】
昨日はPCにライブラリを入れて再起動したらGUIが立ち上がらなくなり、
今日の早朝は別プロジェクトのWebサーバーを落としてしまいました。
安定してきたと思った矢先。
どっちも解決しましたが、一寸先は闇とはこのこと。
")

(client/post chatwork-url
             {:headers {"X-ChatWorkToken" chatwork-api-key}
              :form-params {:body nippo-content}})

(let [xs (select reviews (fields :station_id))]
  (->> xs
       frequencies))
       reverse))

(let [xs (select reviews (fields :station_id))]
  (->> xs
       frequencies
       (map (fn [x] (reverse (cons (last x) (vals (first x))))))))
       first))

(map (fn [x] (cons (last x) (vals (first x)))) {{:a 1} 2 {:b 2} 3})

(let [xs (select reviews (fields :station_id))]
  (with-open [file (writer "/home/hiragi/reviews_development.csv")]
    (let [reviews
          (->> xs
               frequencies
               (map (fn [x] (reverse (cons (last x) (vals (first x)))))))]
      (first reviews))))

(with-open [file (writer "/home/hiragi/reviews_development.csv")]
  (doseq [i [1 2 3]]
    (.write file (str i))))

(shell/sh "xdg-open" "/home/hiragi/reviews_development.csv")


(defn compare-map-values [my-map]
  (into (sorted-map-by (fn [key1 key2] (compare (key1 my-map) (key2 my-map)))) my-map))

;(let [my-map {{:a 2} 3, {:b 2} 2}]
;  (vals my-map))

;(compare-map-values {{:c 3} 1, {:a 1} 3 {:b 2} 4})

;(time (Thread/sleep 1000))

;(count [1 2 3 :a :v])

;(doseq [i [1 2 3 :a :v]] (println i))

;(map (fn [x] (+ x 2)) [1 2 3])

(defn now [] (java.time.LocalDateTime/now))
(defn today [] (.format (java.text.SimpleDateFormat. "yyyy/MM/dd") (new java.util.Date)))

;;; えきまっぷ
(defdb db (mysql {:db "station_library_development" :user "root"}))
(defentity railway_lines)
(defentity reviews)
(defentity railway_companies)
(defentity region
  (table :regions)
  (has-many prefectures {:fk :region_id}))
(defentity prefectures)
(defentity stations)

(select railway_lines (limit 1) (fields :name))
(select reviews (limit 10) (fields :station_id))
(select railway_companies (limit 1) (fields :name))

(defn find [entity id] (first (select entity (where {:id id}) (limit 1))))
;(defn find-by [key value] (first (select stations (where {key value}) (limit 1))))
;(find stations 1130101)

(->> (select prefectures)
     (map #(get % :description))
     (sort-by count)
     reverse
     first)


(let [list
      (with-open [file (reader "/home/hiragi/sample.csv")]
        (doall (map (comp first csv/parse-csv) (line-seq file))))]
  (first list))

(defn take-csv
  "Takes file name and reads data."
  [file-name]
  (with-open [file (reader file-name)]
    (doall (map (comp first csv/parse-csv) (line-seq file)))))

(->> (take-csv "/home/hiragi/sample.csv")
     (map (comp #(nth % 2) reverse))
     (sort-by count)
     reverse
     first)

(select prefectures)

(let [sample (atom [])]
  (swap! sample conj 1)
  sample)

(def sample (atom []))
(count @sample)
(swap! sample conj 1)
(conj [] 1)

;(select stations (limit 1) (fields :cluster))
;(select stations (where {:cluster 1130101}) (fields :name :id) (limit 1))
;(update stations (where {:id 100201}) (set-fields {:name "東京！"}))

;(find-by key)
;(select stations (with prefectures) (limit 1))
;(select prefectures (with stations) (limit 1))

(def base (-> (insert* prefectures)))

;(-> base (values [{:id 48 :region_id 7 :name "ハワイ"} {:id 49 :name "オレゴン" :region_id 7}]) (insert))
;(select prefectures (where {:id 48}))
;(delete prefectures (where {:id 49}))

(def prefecture-map
  [{:id 1 :name "北海道"}
   {:id 2 :name "青森県"}])

;prefecture-map

;; クローラー
(map
 (fn [x] (get-in x [:content]))
 (html/select
  (html/html-snippet (get-in (client/get "http://iko-yo.net/facilities?prefecture_ids=[13]") [:body]))
  [:a]))

(let [conn (mg/connect)
      db   (mg/get-db conn "monger-test")]
  ;; with a generated document id, returns the complete
  ;; inserted document
  (mc/insert-and-return db "documents" {:name "John" :age 30}))


(def todoran-url "http://todo-ran.com/t/kiji/10107")

(defn prefecture-id? [x]
  (if (empty? x)
    false
    (let [y (read-string x)]
      (if (number? y)
        (<= 1 (read-string x) 47)
        false))))

(defn strip-all [hash-map])


(defn sanitize-row [row]
  (let [rank (get (first row) :content)
        prefecture (get (first (get (second row) :content)) :content)
        store-count (get (nth row 3) :content)
        count-per-10000 (get (nth row 4) :content)
        dev (get (last row) :content)]
    {:rank (last rank)
     :prefecture (last prefecture)
     :store-count (last store-count)
     :count-per-100000 (last count-per-10000)
     :dev (last dev)}))

(defn fetch-todoran [url]
  (let [doc (html/html-snippet (client/get url {:as "euc-jp"}) [:#kiji_table_swap :#t_hensa])
        trs (filter
             #(prefecture-id? (first (get-in (first %) [:content])))
             (map
              #(get-in % [:content])
              (html/select doc [:tr])))
        title (-> (html/select doc [:title]) first (get :content) last)]
    (assoc
     {:data (map #(sanitize-row %) trs)}
     :title title
     :url url)))

(defn todoran-url [id] (str "http://todo-ran.com/t/kiji/" id))

(let [conn (mg/connect)
      db   (mg/get-db conn "monger-test")]
  ;; with a generated document id, returns the complete
  ;; inserted document
  (mc/insert-and-return db "documents" (fetch-todoran (todoran-url 12090))))

(let [conn (mg/connect)
      db   (mg/get-db conn "monger-test")]
  (let [doc (mc/find-one-as-map db "documents" {:url "http://todo-ran.com/t/kiji/21363"})
        lists (map #(get % :prefecture) (doc :data))
        title (doc :title)]
    (assoc {:title title} :data (take 20 lists))))

;http://todo-ran.com/t/kiji/21363
