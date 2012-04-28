package utils
{
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	import mx.utils.StringUtil;

	public class IPValidator extends Validator
	{
		private var results:Array;
		public var errorMessage:String;
		
		public function IPValidator() {
			super();
		}
		
		override protected function doValidation(value:Object):Array {
			results = [];
			results = super.doValidation(value);
			if(!required && (value == null || StringUtil.trim(String(value)) == ""))
				return results;
			if(value != null) {
				var pattern:RegExp = /^([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])$/;
    			if(value.search(pattern) == -1) {
    				if(!errorMessage) errorMessage = Str.xml.invalid_ip.@string;
    				results.push(new ValidationResult(true, null, "invalidAddress", errorMessage));
    			}
			}
			return results;
		}
	}
}