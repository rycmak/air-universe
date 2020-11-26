import flatpickr from "flatpickr";

flatpickr(".datepicker", {});

//calenda range functionality - experimental but stable
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#range_start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#range_end"})]
});