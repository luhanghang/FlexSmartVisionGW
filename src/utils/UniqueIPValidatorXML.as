package utils
{
	import mx.validators.ValidationResult;

	public class UniqueIPValidatorXML extends UniqueValidatorXML
	{
		private var results:Array;
		
		public var ipError:String;
		
		public function UniqueIPValidatorXML() {
			super();
		}
		
		override protected function doValidation(value:Object):Array {
			results = [];
			results = super.doValidation(value);
			if(value != null) {
				var pattern:RegExp = /^([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])\.([01]?\d\d?|2[0-4]\d|25[0-5])$/;
    			if(value.search(pattern) == -1) {
    				ipError = Str.xml.invalid_ip.@string;
    				results.push(new ValidationResult(true, null, "invalidAddress",ipError ));
    			}
			}
			return results;
		}
	}
}