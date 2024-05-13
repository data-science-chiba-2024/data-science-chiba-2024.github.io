# Install tidytuesdayR package
## install.packages("tidytuesdayR")

library(tidyverse)
library(nycflights13)

# nycflights13パッケージに時間毎の天気のデータを含むweatherというデータフレームが入っています。
# flightsとweatherを使って、最も風速が速かったフライトを求めなさい（コードも書いてください）。

flights |>
  left_join(weather) |>
  arrange(desc(wind_speed))

nycflights13パッケージに時間毎の飛行機のデータを含むplanesというデータフレームが入っています。
flightsとplanesを使って、最もフライトの数が多かった飛行機創造会社（manufacturer）の二つを求めなさい（コードも書いてください）。

flights |>
  group_by(tailnum) |>
  summarize(n = n()) |>
  arrange(desc(n)) |>
  left_join(planes, by = join_by(tailnum))


# レポートでは、生データをダウンロードして、自ら解析を行います。データは tidytuesdayRという
# Rパッケージを使ってダウンロードします。まず、tidytuesdayを自分のパソコンにインストールして
# ください。そうしたら、以下のコードでerasmusというデータを読み込んでください。
# erasmusにはいつくの行と列が入っていますか？
# erasmusにはどのようなデータが入っていますか？このサイトを参考にしてください：
# https://github.com/rfordatascience/tidytuesday/tree/c0168e6866dc33bb2ddfd58328eac8b83e239db6/data/2022/2022-03-08#eu-student-mobility

# 第5回の宿題
# 第5回の宿題をポストしました。来週の授業（５月1７日23:59）までに提出して下さい。

library(tidytuesdayR)

tuesdata <- tt_load(2022, week = 10)

erasmus <- tuesdata$erasmus



erasmus |>
  group_by(receiving_country_code) |>
  summarize(n = n()) |>
  arrange(desc(n))

erasmus |>
  group_by(receiving_country_code) |>
  summarize(total = sum(participants)) |>
  arrange(desc(total))

erasmus |>
  filter(mobility_duration == 1) |>
  slice(1) |>
  glimpse()

erasmus |>
  filter(participant_age > 0, participant_age < 100) |>
  ggplot(aes(x = participant_age)) + geom_histogram()


erasmus |>
  count(mobility_duration) %>%
  print(n = 50)
