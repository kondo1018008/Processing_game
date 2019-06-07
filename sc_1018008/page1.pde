/* show page 1 */
void disp1() {
  text("Weather", 20, 60);
  pushMatrix();
  scale(2);
  text(title, 10, 100);
  for (int i = 0; i < forecasts.size(); i++) {
    JSONObject f = forecasts.getJSONObject(i);
    String s = f.getString("dateLabel") + ":" + f.getString("telop");
    JSONObject t = f.getJSONObject("temperature");
    if (!t.isNull("min")) {
      String d = t.getJSONObject("min").getString("celsius");
      s = s + ", 最低気温:" + d;
    }
    if (!t.isNull("max")) {
      String d = t.getJSONObject("max").getString("celsius");
      s = s + ", 最高気温:" + d;
    }

    text(s, 10, 120 + 20 * i);
  } 
  popMatrix();
}
