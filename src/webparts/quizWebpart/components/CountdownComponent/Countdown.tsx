import * as React from 'react';

interface CountdownProps {
    minutes: number;
    onEnd: () => void;
}

const Countdown: React.FC<CountdownProps> = ({ minutes, onEnd }) => {
    const [seconds, setSeconds] = React.useState(minutes * 60);

    React.useEffect(() => {
        if (seconds > 0) {
            const timerId = setTimeout(() => {
                setSeconds(seconds - 1);
            }, 1000);
            return () => clearTimeout(timerId);
        } else {
            onEnd();
        }
    }, [seconds, onEnd]);

    const displayMinutes = Math.floor(seconds / 60);
    const displaySeconds = seconds % 60;

    return (
        <div>{displayMinutes} : {displaySeconds}</div>
    );
};

export default Countdown;

