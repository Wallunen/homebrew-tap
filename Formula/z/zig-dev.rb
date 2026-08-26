class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260826-005759"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "390f70e3a82b9e4b658e2a7e26889933d1c0a250a2c223063e2d1394f2f47bfe"
    sha256 cellar: :any_skip_relocation, sequoia:      "9004d7eeb59b1c96fb1b476a08534846e1fedd30d661408be1ddaf3bc081b218"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6ad98de164e61cf2185682942cb427870f81423db5954ea4722ca11aee2d91a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "6823b087f95647f9eb6deb043b6516df4aed177bea374c77f01023731faa552b" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "32eb1b6c9f36f7dc8fc5795406fb3106c4bb394d9523747c1a1e2e141584a6e6" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "8e76bc57585fc9c257c6c3053a522501f6a6e7baae801490d269ec036c75b58d" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1862+40ebd8162.tar.xz"
  version "0.17.0-dev.1862+40ebd8162"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
