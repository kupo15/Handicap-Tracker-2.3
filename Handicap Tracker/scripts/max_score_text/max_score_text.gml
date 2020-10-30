
function max_score_text(num){

switch num
	{
	case -2: return "Eagle"; break;
	case -1: return "Birdie"; break;
	case 0: return "Par"; break;
	case 1: return "Bogey"; break;
	case 2: return "Double Bogey"; break;
	case 3: return "Triple Bogey"; break;
	case 4: return "Quad Bogey"; break;
	case 5: return "5 over Par"; break;
	case 6: return "6 over Par"; break;
	default: return ""; break;
	}
}