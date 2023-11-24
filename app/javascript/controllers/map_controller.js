import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static targets = ["carte", "list", "toggleButton", "map"];

  static values = {
    apiKey: String,
    markers: Array,
  }

  connect() {
    console.log("hello")
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10",
    });


    this.map.on('load', () => {

      this.#addMarkersToMap();
      this.#fitMapToMarkers();
    })

  }



  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.marker_html;
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }





  toggleView() {
    this.carteTarget.classList.toggle('d-none');
    this.listTarget.classList.toggle('d-none');
    if (this.toggleButtonTarget.innerText === 'Show on the Map') {
      this.toggleButtonTarget.innerText = 'Show the List';
    } else {
      this.toggleButtonTarget.innerText = 'Show on the Map';
    }
    this.map.resize();
  }


}
