package com.cisau.common.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.spatial4j.core.io.GeohashUtils;

public class GeoHashUtil {

	public static void main(String[] args) {
		Map<String, String> map = new HashMap<>();

		map.put("山西农业大学信息学院", "112.584376,37.455626");
		map.put("山西农大信息学院游泳馆", "112.586083,37.454552");
		map.put("尚客网咖", "112.579669,37.457911");
		map.put("信息学院影城", "112.582656,37.457044");

		map.put("山西太谷中医医院", "112.571954,37.433361");
		map.put("嘉兴隆旧址", "112.57146,37.433193");
		map.put("义全德旧址", "112.570023,37.432822");

		map.put("凤凰山森林公园", "112.597917,37.368917");
		map.put("太谷西高铁站", "112.516298,37.45241");
		map.put("武家堡村口公交站", "112.520529,37.448112");

		Set<Entry<String, String>> entries = map.entrySet();
		for (Entry<String, String> entry : entries) {
			try {
				String value = entry.getValue();
				String[] split = value.split(",");
				double lon = Double.parseDouble(split[0]); // 经度
				double lat = Double.parseDouble(split[1]);
				String geoCode = GeohashUtils.encodeLatLon(lat, lon, 5);
				String sql = "insert into t_place_dict values ('" + entry.getKey() + "'," + lon + "," + lat + ",'"
						+ geoCode + "');";
				System.out.println(sql);
			} catch (Exception e) {
				System.err.println(entry.getKey());
			}
		}
	}
}
