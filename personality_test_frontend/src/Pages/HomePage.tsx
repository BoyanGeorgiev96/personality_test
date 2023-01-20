import {QuestionList} from '../Questions/QuestionsList'
import { ButtonPrimary } from '../props/ButtonProps'
import Signin from '../Signin';

export const HomePage = () => (
  <>
    <QuestionList />
    <ButtonPrimary onClick={Signin}>Start the quiz</ButtonPrimary>
  </>
)